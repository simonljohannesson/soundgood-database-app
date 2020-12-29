#include <iostream>
#include "CommandLineView.h"
#include "ViewSession.h"

namespace view{



void CommandLineView::StartUserInterface(){
    bool loop = true;
    while(loop){
        std::cout << INITIALIZATION_PROMPT << "\n";
        int input;
        std::cin >> input;
        if (input == 1){
            std::cout << LOGIN_PROMPT << "\n";
            std::string username;
            std::cin >> username;
            std::cout << "username: " << username << "\n";
            try{
                ViewSession view_session{username, soundgood};
                view_session.StartSession();
            }catch (std::exception &e){ //TODO: correct exception caught...
                std::cout << e.what();
            }
        }
        else if (input == 2){
            loop = false;
        }
        else{
            std::cout << LOGIN_ERROR_PROMPT << "\n";
        }
    }
    std::cout << "Shutting down." << std::endl;
}

}