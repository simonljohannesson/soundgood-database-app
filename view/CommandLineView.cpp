#include <iostream>
#include "CommandLineView.h"
#include "ViewSession.h"
#include "../integration/InvalidUsernameError.h"
#include "../integration/DatabaseError.h"

namespace view{

void CommandLineView::StartUserInterface(){
    bool loop = true;
    while(loop){
        std::cout << INITIALIZATION_PROMPT << "\n";
        std::string input;
        std::getline(std::cin, input);
        int input_parsed = std::atoi(input.c_str());

        if (input_parsed == 1){
            std::cout << LOGIN_PROMPT << "\n";
            std::string username;
            std::getline(std::cin, username);
            try {
                ViewSession view_session{username, soundgood};
                view_session.StartSession();
            }catch(integration::DatabaseError &error){
                std::cout << DATABASE_ERROR_PROMPT << "\n";
            }catch (integration::InvalidUsernameError &error){
                std::cout << LOGIN_ERROR_PROMPT << "\n";
            }
        }
        else if (input_parsed == 2){
            loop = false;
        }
        else{
            std::cout << INPUT_ERROR_PROMPT << "\n";
        }
    }
    std::cout << "Shutting down." << std::endl;
}

}