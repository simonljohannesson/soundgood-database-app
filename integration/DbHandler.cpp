#include <iostream>
#include "DbHandler.h"

namespace integration{

DbHandler::DbHandler(const std::string &database_connection_config):
        connection{database_connection_config},
        database_connection_config{database_connection_config} {
    PrepareRequestAvailableRentalInstrument();
}

std::vector<dto::RentalInstrument> DbHandler::RequestAvailableRentalInstruments(
        const std::string &instrument_type){
    pqxx::work tx{connection};
    pqxx::result result = tx.exec_prepared("get_available_rental_instruments", instrument_type);

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
                (row[4].is_null()), // monthly fee
                (row[5].is_null()? -1 : row[5].as<int>()) // max_lease_in_days
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

void DbHandler::PrepareRequestAvailableRentalInstrument(){
    const std::string SQL_STATEMENT =
        "select "
        "    ri.id as rental_instrument_id, "
        "    instrument_id, "
        "    brand, "
        "    it.type, "
        "    monthly_fee, "
        "    max_lease_in_days, "
        "    max(r.start_date) as start_date, "
        "    r.return_date, "
        "    instrument_type_id "
        "from rental_instrument as ri "
        "full join rental as r "
        "on ri.id=r.rental_instrument_id "
        "inner join instrument_type as it "
        "on it.id=ri.instrument_type_id "
        "where it.type=$1 "
        "group by "
        "    ri.id, "
        "    instrument_id, "
        "    brand, "
        "    monthly_fee, "
        "    r.start_date, "
        "    r.return_date, "
        "    max_lease_in_days, "
        "    instrument_type_id, "
        "    it.type "
        "having (r.start_date IS NULL AND r.return_date IS NULL) "
        "OR r.return_date IS NOT NULL; ";
    // TODO: can throw pqxx::syntax_error, sql_error
    connection.prepare("get_available_rental_instruments", SQL_STATEMENT);
}




}