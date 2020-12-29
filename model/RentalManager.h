#ifndef SOUNDGOOD_RENTALMANAGER_H
#define SOUNDGOOD_RENTALMANAGER_H

#include <vector>
#include "../dto/RentalInstrument.h"
#include "../integration/DbHandler.h"

namespace model {

class RentalManager {
public:
    RentalManager() = default;
    /**
     * Fetches the rental instruments available for rental.
     *
     * Can throw integration::DatabaseError.
     *
     * @param instrument_type type of instrument to search for
     * @param db_handler
     * @return vector of rental instruments that are available for rental
     */
    std::vector<dto::RentalInstrument> RequestAvailableRentalInstruments(
            const std::string &instrument_type,
            std::shared_ptr<integration::DbHandler> &db_handler);
    /**
     * Starts a rental for a student with the chosen instrument_id.
     *
     * Can throw:
     * - integration::DatabaseError
     * - model::StudentNotEnrolledError
     * - model::NumberAllowedRentalsExceededError
     * - model::InstrumentNotAvailableError
     * @param student_id
     * @param instrument_id
     * @param db_handler
     */
    void RentInstrument(
            int student_id,
            const std::string &instrument_id,
            std::shared_ptr<integration::DbHandler> &db_handler);
    /**
     * Terminates rental.
     *
     * Can throw:
     * - integration::DatabaseError
     * - model::RentalNotActiveError
     * @param rental_id id of rental to terminate
     * @param student_id id of student associated to the rental to terminate
     * @param db_handler database handler used
     */
    void TerminateRental(
            int rental_id,
            int student_id,
            std::shared_ptr<integration::DbHandler> &db_handler);
    /**
     * Fetch active rentals associated to a student.
     *
     * Can throw integration::DatabaseError.
     *
     * @param student_id id of student
     * @param db_handler
     * @return std::vector of active rentals
     */
    std::vector<dto::ActiveRental> GetActiveRentals(
            int student_id,
            std::shared_ptr<integration::DbHandler> &db_handler);
    /**
     * Returns the student id associated with a username.
     *
     * Can throw integration::DatabaseError.
     *
     * Can also throw integration::InvalidUsernameError if username cannot be found.
     * @param username
     * @param db_handler
     * @return int
     */
    int GetStudentIdFromUsername(
            const std::string &username,
            std::shared_ptr<integration::DbHandler> &db_handler);

};

} // namespace



#endif //SOUNDGOOD_RENTALMANAGER_H
