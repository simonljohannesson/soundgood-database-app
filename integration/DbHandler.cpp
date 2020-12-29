#include <iostream>
#include "DbHandler.h"
#include "../dto/ActiveRental.h"
#include "InvalidUsernameError.h"

namespace integration{

DbHandler::DbHandler(const std::string &database_connection_config):
        connection{database_connection_config},
        database_connection_config{database_connection_config} {

    // initiate the prepared statements
    PrepareRequestAvailableRentalInstrument();
    PrepareGetStudentsActiveRentals();
    PrepareRentalInstrumentIsAvailable();
    PrepareStudentIsEnrolled();
    PrepareSetRentalInstrumentRented();
    PrepareRentalIsActive();
    PrepareTerminateRental();
    PrepareGetStudentIdFromUsername();
}


void DbHandler::PrepareRequestAvailableRentalInstrument(){
    const std::string SQL_STATEMENT =
            "SELECT * FROM available_rental_instruments where type=$1 ;";
    // TODO: can throw pqxx::syntax_error, sql_error
    connection.prepare("get_available_rental_instruments", SQL_STATEMENT);
}

std::vector<dto::RentalInstrument> DbHandler::RequestAvailableRentalInstruments(
        const std::string &instrument_type){
    pqxx::work tx{connection};
    pqxx::result result =
            tx.exec_prepared("get_available_rental_instruments", instrument_type);

    std::vector<dto::RentalInstrument> rental_instruments{};

    if(result.empty()) {
        return rental_instruments;
    }
    else{
        for (auto row : result){
            dto::RentalInstrument rental_instrument{
                row[0].as<int>(), // id
                row[1].as<std::string>(), // instrument id
                (row[2].is_null() ? "" : row[2].as<std::string>()), // brand
                (row[3].is_null() ? "" : row[3].as<std::string>()), // instrument type
                (row[4].is_null() ? -1 : row[4].as<int>()), // monthly fee
                (row[5].is_null() ? -1 : row[5].as<int>())// max_lease_in_days
            };
            rental_instruments.push_back(rental_instrument);
        }
    }

    tx.commit(); // not needed but good practice to end the transaction
    return rental_instruments;
}

void DbHandler::PrepareStudentIsEnrolled(){
    std::string SQL_STATEMENT = "select enrolled from student where id=$1 limit 1;";
    connection.prepare("student_enrolled", SQL_STATEMENT);
}

bool DbHandler::StudentIsEnrolled(int student_id){
    pqxx::work tx{connection};
    pqxx::result result = tx.exec_prepared("student_enrolled", student_id);
    tx.commit();
    if(result.empty()) return false;
    pqxx::row row = result[0];
    bool enrolled = row[0].as<bool>();
    return enrolled;
}

void DbHandler::PrepareGetStudentsActiveRentals(){
    const std::string SQL_STATEMENT =
        "select\n"
        "    r.id as rental_id,\n"
        "    student_id,\n"
        "    rental_instrument_id,\n"
        "    start_date,\n"
        "    return_date,\n"
        "    instrument_id,\n"
        "    brand,\n"
        "    type as instrument_type,\n"
        "    monthly_fee,\n"
        "    max_lease_in_days\n"
        "from rental as r\n"
        "inner join rental_instrument as ri\n"
        "on r.rental_instrument_id = ri.id\n"
        "inner join instrument_type as it\n"
        "on ri.instrument_type_id = it.id\n"
        "where\n"
        "    student_id=$1 AND\n"
        "    start_date is not null and\n"
        "    return_date is null;";
    // TODO: can throw pqxx::syntax_error, sql_error
    connection.prepare("get_students_active_rentals", SQL_STATEMENT);
}

int DbHandler::NumberOfActiveRentals(int student_id){
    pqxx::work tx{connection};
    pqxx::result result = tx.exec_prepared("get_students_active_rentals", student_id);
    tx.commit();
    int count = 0;
    for(auto row : result) count++;
    return count;
}

std::vector<dto::ActiveRental> DbHandler::GetActiveRentals(int student_id) {
    pqxx::work tx{connection};
    pqxx::result result = tx.exec_prepared("get_students_active_rentals", student_id);
    tx.commit();

    std::vector<dto::ActiveRental> rentals;

    if(result.empty()) return rentals;

    for(auto row : result){

        int rental_id =                row[0].as<int>();
        int student_id=               (row[1].is_null() ? -1 : row[1].as<int>());
        int rental_instrument_id =    (row[2].is_null() ? -1 : row[2].as<int>());
        std::string start_date =      (row[3].is_null() ? "null" : row[3].as<std::string>());
        std::string return_date =     (row[4].is_null() ? "null" : row[4].as<std::string>());
        std::string instrument_id =   (row[5].is_null() ? "null" : row[5].as<std::string>());
        std::string brand =           (row[6].is_null() ? "null" : row[6].as<std::string>());
        std::string instrument_type = (row[7].is_null() ? "null" : row[7].as<std::string>());
        int monthly_fee =             (row[8].is_null() ? -1 : row[8].as<int>());
        int max_lease_in_days =       (row[9].is_null() ? -1 : row[9].as<int>());

        dto::Rental rental {
            rental_id,
            student_id,
            rental_instrument_id,
            start_date,
            return_date
        };
        dto::RentalInstrument rental_instrument {
            rental_instrument_id,
            instrument_id,
            brand,
            instrument_type,
            monthly_fee,
            max_lease_in_days
        };
        dto::ActiveRental active_rental {rental, rental_instrument};
        rentals.push_back(active_rental);
    }
    return rentals;
}

void DbHandler::PrepareRentalInstrumentIsAvailable(){
    const std::string SQL_STATEMENT =
            "select * from available_rental_instruments where instrument_id=$1;";
    connection.prepare("rental_instrument_is_available", SQL_STATEMENT);
}

bool DbHandler::RentalInstrumentIsAvailable(const std::string& instrument_identifier){
    pqxx::work tx{connection};
    pqxx::result result =
            tx.exec_prepared("rental_instrument_is_available", instrument_identifier);
    tx.commit();
    if(result.empty()) return false;
    else return true;
}

void DbHandler::PrepareSetRentalInstrumentRented(){
    const std::string SQL_STATEMENT =
            "INSERT INTO rental\n"
            "(student_id, rental_instrument_id, start_date)\n"
            "VALUES\n"
            "($1, (SELECT id FROM rental_instrument WHERE instrument_id=$2), CURRENT_DATE);";
    connection.prepare("set_rental_instrument_rented", SQL_STATEMENT);
}

void DbHandler::SetRentalInstrumentRented(int student_id, const std::string& instrument_id) {
    pqxx::work tx{connection};
    tx.exec_prepared("set_rental_instrument_rented", student_id, instrument_id);
    tx.commit();
}

void DbHandler::PrepareRentalIsActive(){
    const std::string SQL_STATEMENT =
            "select return_date is null as active\n"
            "from rental where id=$1 and student_id=$2;";
    connection.prepare("rental_is_active", SQL_STATEMENT);
}
bool DbHandler::RentalIsActive(int rental_id, int student_id){
    pqxx::work tx{connection};
    pqxx::result result = tx.exec_prepared("rental_is_active", rental_id, student_id);
    tx.commit();
    if(result.empty()) return false;
    pqxx::row row = result[0];
    bool rental_active = row[0].as<bool>();
    return rental_active;
}

void DbHandler::PrepareTerminateRental(){
    const std::string SQL_STATEMENT =
            "update rental\n"
            "set return_date = CURRENT_DATE\n"
            "where id = $1;";
    connection.prepare("terminate_rental", SQL_STATEMENT);
}

void DbHandler::TerminateRental(int rental_id){
    pqxx::work tx{connection};
    tx.exec_prepared("terminate_rental", rental_id);
    tx.commit();
}

void DbHandler::PrepareGetStudentIdFromUsername(){
    const std::string SQL_STATEMENT =
            "select\n"
            "  s.id as student_id\n"
            "from person as p\n"
            "inner join student s on p.id = s.person_id\n"
            "where user_name='$1';";
    connection.prepare("get_student_id_from_username", SQL_STATEMENT);
}

int DbHandler::GetStudentIdFromUsername(const std::string &username) {
    pqxx::work tx{connection};
    pqxx::result result = tx.exec_prepared("get_student_id_from_username", username);
    tx.commit();

    if(result.empty()){
        throw integration::InvalidUsernameError("Could not find username " + username);
    }

    pqxx::row row = result[0];
    int student_id = row[0].as<int>();
    return student_id;
}

}