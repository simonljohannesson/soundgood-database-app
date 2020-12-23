#ifndef SOUNDGOOD_DBHANDLER_H
#define SOUNDGOOD_DBHANDLER_H

#include <string>
#include <vector>
#include <pqxx/pqxx>

#include "../dto/RentalInstrument.h"

namespace integration {

/**
 * Handler for a PostgreSQL database.
 *
 * Connection to database is established on creation and closed on destruction.
 */
class DbHandler {
private:
    std::string database_connection_config;
    pqxx::connection connection;
    void PrepareRequestAvailableRentalInstrument();
public:
    explicit DbHandler(const std::string & database_connection_config);

    std::vector<dto::RentalInstrument> RequestAvailableRentalInstruments(
            const std::string &instrument_type);

    bool connected();
};

} // namespace
#endif //SOUNDGOOD_DBHANDLER_H
