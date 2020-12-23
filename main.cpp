#include <iostream>
#include "integration/DbHandler.h"
#include "controller/Soundgood.h"

int main() {
    const std::string config =
            "dbname=soundgood user=postgres password=password hostaddr=127.0.0.1 port=5432";

    {
        std::cout << "test 1: \n";
        integration::DbHandler dbHandler{config};
        for (auto& rental : dbHandler.GetActiveRentals(3)){
            std::cout << rental << "\n";
        }
    }

    {
        std::cout << "test 2: \n";
        controller::Soundgood controller_soundgood{config};
        std::vector<dto::RentalInstrument> result =
                controller_soundgood.FetchAvailableRentalInstruments("recorder");
        for (auto& instrument : result){
            std::cout << instrument << "\n";
        }
        std::cout << "\n";

    }

    return 0;
}
