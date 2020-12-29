#include "ViewSession.h"
#include "../controller/Soundgood.h"

namespace view{

ViewSession::ViewSession(
            std::string username, std::shared_ptr<controller::Soundgood> controller):
            username{std::move(username)},
            controller{controller}{
    // TODO: throws
    std::cout << "username: '" << this->username << "'\n";
    student_id = controller->GetStudentIdFromUsername(this->username);
}

void ViewSession::StartSession(){
    // TODO:: WHILE LOOP!!!
    std::cout << HELP_PROMPT;
    int input;
    std::cin >> input;
    switch (input){
        case 1:
            std::cout << HELP_PROMPT;
            break;
        case 2:
            // TODO: DISPLAY ACTIVE RENTALS
            break;
        case 3:
            // TODO: DISPLAY AVAILABLE RENTAL INSTRUMENTS
            break;
        case 4:
            // TODO: RENT INSTRUMENT
            break;
        case 5:
            // TODO: TERMINATE RENTAL
            break;
        case 6:
            // TODO: BREAK WHILE LOOP
            break;
        default:
            std::cout << ERROR_PROMPT;
    }
}

}