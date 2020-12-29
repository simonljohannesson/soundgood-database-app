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
 * Handler for Soundgood PostgreSQL database.
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
    /**
     * Constructor.
     *
     * Can throw integration::DatabaseError and pqxx::failure.
     *
     * @param database_connection_config
     */
    explicit DbHandler(const std::string & database_connection_config);
    /**
     * Query database for rental instruments available for rental.
     *
     * Can throw integration::DatabaseError.
     *
     * @param instrument_type type of instrument to search for
     * @return vector of rental instruments that are available for rental
     */
    std::vector<dto::RentalInstrument> RequestAvailableRentalInstruments(
            const std::string &instrument_type);
    /**
     * Query database for all active rentals associated to a student.
     *
     * Can throw integration::DatabaseError.
     *
     * @param student_id
     * @return std::vector of active rentals, vector empty if there are none.
     */
    std::vector<dto::ActiveRental> GetActiveRentals(int student_id);
    /**
     * Query database if a rental instrument is available for rental.
     *
     * Can throw integration::DatabaseError.
     *
     * @param instrument_identifier string that uniquely identifies instrument
     * @return true if available, else false
     */
    bool RentalInstrumentIsAvailable(const std::string& instrument_identifier);
    /**
     * Returns the number of active rentals associated with a student.
     *
     * Can throw integration::DatabaseError.

     * @param student_id
     * @return int
     */
    int NumberOfActiveRentals(int student_id);
    /**
     * Checks if a student is enrolled.
     *
     * Can throw integration::DatabaseError.

     * @param student_id
     * @return bool
     */
    bool StudentIsEnrolled(int student_id);
    /**
     * Sets a rental instrument as rented in the database, i.e. starts a rental.
     *
     * Can throw integration::DatabaseError.
     *
     * @param student_id
     * @param instrument_id
     */
    void SetRentalInstrumentRented(int student_id, const std::string &instrument_id);
    /**
     * Checks if a rental is active.
     *
     * Can throw integration::DatabaseError.
     *
     * @param rental_id
     * @param student_id
     * @return bool
     */
    bool RentalIsActive(int rental_id, int student_id);
    /**
     * Terminates a rental.
     *
     * Can throw integration::DatabaseError.
     *
     * @param rental_id
     */
    void TerminateRental(int rental_id);
    /**
     * Returns the student id associated with a username.
     *
     * Can throw integration::DatabaseError.
     *
     * Can also throw integration::InvalidUsernameError if username cannot be found.
     *
     * @param username
     * @return
     */
    int GetStudentIdFromUsername(const std::string &username);
};

} // namespace
#endif //SOUNDGOOD_DBHANDLER_H
