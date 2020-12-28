#include <iostream>
#include "DbHandler.h"

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
bool DbHandler::connected() {
    return connection.is_open();
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
        "select "
        "    r.id as rental_id, "
        "    r.student_id, "
        "    ri.id as rental_instrument_id,"
        "    max(r.start_date) as start_date, "
        "    r.return_date, "
        "    instrument_id as instrument_identifier "
        "from rental_instrument as ri "
        "full join rental as r "
        "on ri.id=r.rental_instrument_id "
        "inner join instrument_type as it "
        "on it.id=ri.instrument_type_id "
        "where r.student_id=$1 "
        "group by "
        "    r.id, "
        "    ri.id, "
        "    instrument_id, "
        "    brand, "
        "    monthly_fee, "
        "    r.start_date, "
        "    r.return_date, "
        "    max_lease_in_days, "
        "    instrument_type_id, "
        "    it.type, "
        "    r.student_id "
        "having r.return_date IS NULL;";
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

std::vector<dto::Rental> DbHandler::GetActiveRentals(int student_id) {
    pqxx::work tx{connection};
    pqxx::result result = tx.exec_prepared("get_students_active_rentals", student_id);

    std::vector<dto::Rental> rentals;

    if(result.empty()) return rentals;

    for(auto row : result){
        dto::Rental rental {
            row[0].as<int>(),                                   // rental id
            (row[1].is_null() ? -1 : row[1].as<int>()),         // student id
            (row[2].is_null() ? -1 : row[2].as<int>()),         // rental instrument id
            (row[3].is_null() ? "null" : row[3].as<std::string>()), // start_date
            (row[4].is_null() ? "null" : row[4].as<std::string>())  // return_date
        };
        rentals.push_back(rental);
    }
    tx.commit();
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


}