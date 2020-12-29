#ifndef SOUNDGOOD_SOUNDGOOD_H
#define SOUNDGOOD_SOUNDGOOD_H

#include "../integration/DbHandler.h"
#include "../model/RentalManager.h"
#include <memory>

namespace controller {

class Soundgood {
private:
    std::shared_ptr<integration::DbHandler> db_handler;
    model::RentalManager rental_manager;
public:
    Soundgood(const std::string& database_config); // model access
    /**
     * Fetches the rental instruments available for rental.
     *
     * Can throw integration::DatabaseError.
     *
     * @param instrument_type
     * @return
     */
    std::vector<dto::RentalInstrument>FetchAvailableRentalInstruments(
            const std::string& instrument_type);
    /**
     * Starts a rental for a student with the chosen instrument_id.
     *
     * Can throw:
     * - integration::DatabaseError
     * - model::StudentNotEnrolledError
     * - model::NumberAllowedRentalsExceededError
     * - model::InstrumentNotAvailableError
     *
     * @param student_id
     * @param instrument_identifier
     */
    void RentInstrument(int student_id, const std::string &instrument_identifier);
    /**
     * Terminates rental.
     *
     * Can throw:
     * - integration::DatabaseError
     * - model::RentalNotActiveError
     *
     * @param rental_id
     * @param student_id
     */
    void TerminateRental(int rental_id, int student_id);
    /**
     * Fetch active rentals associated to a student.
     *
     * Can throw integration::DatabaseError.
     *
     * @param student_id d of student
     * @return
     */
    std::vector<dto::ActiveRental> GetActiveRentals(int student_id);
    /**
     * Returns the student id associated with a username.
     *
     * Can throw:
     * - integration::DatabaseError
     * - integration::InvalidUsernameError
     *
     * @param username
     * @return
     */
    int GetStudentIdFromUsername(std::string username);
};

} // namespace
#endif //SOUNDGOOD_SOUNDGOOD_H
