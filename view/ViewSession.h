#ifndef SOUNDGOOD_VIEWSESSION_H
#define SOUNDGOOD_VIEWSESSION_H

#include <string>
#include "../controller/Soundgood.h"

namespace view{

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
public:
    ViewSession(std::string username, std::shared_ptr<controller::Soundgood> controller);

    void StartSession();

    void DisplayActiveRentals();

    void DisplayAvailableRentalInstruments();

    void RentInstrument();

    void TerminateRental();
};

}


#endif //SOUNDGOOD_VIEWSESSION_H
