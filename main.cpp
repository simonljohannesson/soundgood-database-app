#include <memory>
#include <pqxx/pqxx>

#include "integration/DbHandler.h"
#include "controller/Soundgood.h"
#include "view/CommandLineView.h"
#include "integration/DatabaseError.h"

int main() {
    const std::string config =
            "dbname=soundgood "
            "user=postgres "
            "password=example "
            "hostaddr=127.0.0.1 "
//            "hostaddr=172.17.0.2 " // Authors docker container IP
            "port=5432";

    try {
        std::shared_ptr<controller::Soundgood> soundgood
                = std::make_shared<controller::Soundgood>(config);

        view::CommandLineView view{soundgood};
        view.StartUserInterface();
    }catch(std::exception &error){
        std::cerr << "Unexpected error: " << error.what() << "\n";
        std::cerr << "Terminating program.\n";
    }

    return 0;
}
