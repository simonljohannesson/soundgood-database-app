#ifndef SOUNDGOOD_VIEWSESSION_H
#define SOUNDGOOD_VIEWSESSION_H

#include <string>
#include "../controller/Soundgood.h"

namespace view{

/**
 * Class that handles a students session.
 *
 * Constructor can throw:
 * - integration::DatabaseError
 * - integration::InvalidUsernameError
 */
class ViewSession {
private:
    const std::string username;
    int student_id;
    std::shared_ptr<controller::Soundgood> controller;
    const std::string HELP_PROMPT =
            " What would you like to do? Insert the number next to \n"
            " the corresponding task that you would like to perform.\n"
            " \n"
            "  1   Display which tasks can be performed. (Display this message again.)\n"
            "  2   Display a student's active rentals.\n"
            "  3   Display all instruments that are available for rental.\n"
            "  4   Rent an instrument.\n"
            "  5   Terminate a rental.\n"
            "  6   Log out.\n";
    const std::string ERROR_PROMPT = "Could not understand that. Try again.\n";
    const std::string DATABASE_ERROR_PROMPT =
            "ERROR: Could not access database. "
            "Please try again. If the issue persists contact the administrator.";
    const std::string STUDENT_NOT_ENROLLED_PROMPT =
            "ERROR: Student is not enrolled.";
    const std::string EXCEEDED_RENTALS_EXCEEDED_PROMPT =
            "ERROR: Students can at most rent 2 instruments at a time.";
    const std::string INSTRUMENT_NOT_AVAILABLE_PROMPT =
            "ERROR: The selected instrument is not available.";
    const std::string RENTAL_NOT_ACTIVE_PROMPT =
            "ERROR: The selected rental could not be terminated.\n"
            "       Either the rental is not active or it is not associated with the "
            "student that is logged in.";
    void DisplayActiveRentals();
    void DisplayAvailableRentalInstruments();
    void RentInstrument();
    void TerminateRental();
public:
    ViewSession(std::string username, std::shared_ptr<controller::Soundgood> controller);
    /**
     * Start student session.
     */
    void StartSession();

};

}


#endif //SOUNDGOOD_VIEWSESSION_H
