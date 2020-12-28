#ifndef SOUNDGOOD_DBHANDLER_H
#define SOUNDGOOD_DBHANDLER_H

#include <string>
#include <vector>
#include <pqxx/pqxx>

#include "../dto/RentalInstrument.h"
#include "../dto/Rental.h"

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
    void PrepareGetStudentsActiveRentals();
    void PrepareRentalInstrumentIsAvailable();
    void PrepareStudentIsEnrolled();
    void PrepareSetRentalInstrumentRented();
public:
    explicit DbHandler(const std::string & database_connection_config);
    std::vector<dto::RentalInstrument> RequestAvailableRentalInstruments(
            const std::string &instrument_type);
    std::vector<dto::Rental> GetActiveRentals(int student_id);
    bool RentalInstrumentIsAvailable(const std::string& instrument_identifier);
    bool connected();
    int NumberOfActiveRentals(int student_id);
    bool StudentIsEnrolled(int student_id);
    void SetRentalInstrumentRented(int student_id, const std::string &instrument_id);

};

} // namespace
#endif //SOUNDGOOD_DBHANDLER_H
