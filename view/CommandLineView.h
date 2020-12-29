#ifndef SOUNDGOOD_COMMANDLINEVIEW_H
#define SOUNDGOOD_COMMANDLINEVIEW_H

#include <string>
#include "../controller/Soundgood.h"
#include <memory>

namespace view{

class CommandLineView {
private:
    const std::string INITIALIZATION_PROMPT=
            "Welcome student. Please press:\n"
            "1 To log in.\n"
            "2 To exit";
    const std::string LOGIN_PROMPT =
            "Please enter your user id.";
    const std::string LOGIN_ERROR_PROMPT =
            "Could not log in.";
    std::shared_ptr<controller::Soundgood> soundgood;
public:
    CommandLineView(std::shared_ptr<controller::Soundgood> controller):
            soundgood(std::move(controller)){};

/*
 * Help text:
 *
 * Welcome, please enter your user id.
 *
 *
 * What would you like to do? Insert the number next to the corresponding
 * task that you would like to perform.
 *
 * 0   Display which tasks can be performed. (Display this message again.)
 * 1   Display a student's active rentals.
 * 2   Display all instruments that are available for rental.
 * 3   Rent an instrument.
 * 4   Terminate a rental.
 * 5   Log out.
 *
 */

    void StartUserInterface();
};

} // namespace



#endif //SOUNDGOOD_COMMANDLINEVIEW_H
