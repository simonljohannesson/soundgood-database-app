#ifndef SOUNDGOOD_DBHANDLER_H
#define SOUNDGOOD_DBHANDLER_H

#include <string>
#include <vector>
#include <pqxx/pqxx>

#include "../dto/RentalInstrument.h"
#include "../dto/Rental.h"
#include "../dto/ActiveRental.h"

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
    void PrepareRentalIsActive();
    void PrepareTerminateRental();
    void PrepareGetStudentIdFromUsername();

public:
    explicit DbHandler(const std::string & database_connection_config);
    std::vector<dto::RentalInstrument> RequestAvailableRentalInstruments(
            const std::string &instrument_type);
    std::vector<dto::ActiveRental> GetActiveRentals(int student_id);
    bool RentalInstrumentIsAvailable(const std::string& instrument_identifier);
    int NumberOfActiveRentals(int student_id);
    bool StudentIsEnrolled(int student_id);
    void SetRentalInstrumentRented(int student_id, const std::string &instrument_id);
    bool RentalIsActive(int rental_id, int student_id);
    void TerminateRental(int rental_id);


    int GetStudentIdFromUsername(const std::string &username);
};

} // namespace
#endif //SOUNDGOOD_DBHANDLER_H
