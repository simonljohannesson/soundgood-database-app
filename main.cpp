#include <iostream>
#include "integration/DbHandler.h"
#include "controller/Soundgood.h"
#include "view/CommandLineView.h"
#include <memory>

int main() {
    const std::string config =
            "dbname=soundgood "
            "user=postgres "
            "password=password "
            "hostaddr=127.0.0.1 "
            "port=5432";

    std::shared_ptr<controller::Soundgood> soundgood
            = std::make_shared<controller::Soundgood>(config);

    view::CommandLineView view{soundgood};
    view.StartUserInterface();

    return 0;
}
