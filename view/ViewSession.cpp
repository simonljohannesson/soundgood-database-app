#include "ViewSession.h"
#include "../integration/DatabaseError.h"
#include "../model/StudentNotEnrolledError.h"
#include "../model/NumberAllowedRentalsExceededError.h"
#include "../model/InstrumentNotAvailableError.h"
#include "../model/RentalNotActiveError.h"

namespace view{

ViewSession::ViewSession(
            std::string username,
            std::shared_ptr<controller::Soundgood> controller):
            username{std::move(username)},
            controller{controller}{
    student_id = controller->GetStudentIdFromUsername(this->username);
}

void ViewSession::StartSession(){
    bool loop = true;
    while (loop){
        std::cout << HELP_PROMPT;
        std::string input_str;
        std::getline(std::cin, input_str);
        int input = std::atoi(input_str.c_str());
        switch (input) {
            case 1:
                std::cout << HELP_PROMPT;
                break;
            case 2:
                DisplayActiveRentals();
                break;
            case 3:
                DisplayAvailableRentalInstruments();
                break;
            case 4:
                RentInstrument();
                break;
            case 5:
                TerminateRental();
                break;
            case 6:
                loop = false;
                std::cout << "Logging out\n";
                break;
            default:
                std::cout << ERROR_PROMPT;
        }
    }
}

void ViewSession::DisplayActiveRentals(){
    try{
        std::vector<dto::ActiveRental> active_rentals = controller->GetActiveRentals(student_id);
        if (!active_rentals.empty()) {
            std::cout << "ACTIVE RENTALS:\nRental id:\tStart date:\tInstrument id:\tBrand:\tMonthly fee:\n";
            for (auto &active_rental : active_rentals) {
                std::cout << active_rental.getRental().getId() << "\t";
                std::cout << active_rental.getRental().getStartDate() << "\t";
                std::cout << active_rental.getRentalInstrument().getInstrumentId() << "\t";
                std::cout << active_rental.getRentalInstrument().getBrand() << "\t";
                std::cout << active_rental.getRentalInstrument().getMonthlyFee() << "\n";
            }
        } else {
            std::cout << "Could not find any active rentals associated to username: ";
            std::cout << username << ".\n";
        }
    }catch (integration::DatabaseError &error){
        std::cout << DATABASE_ERROR_PROMPT << "\n";
    }
}
void ViewSession::DisplayAvailableRentalInstruments(){
    try{
        std::cout << "Enter which instrument type you would like to show.\n";
        std::string instrument_type;
        std::getline(std::cin, instrument_type);
        std::vector<dto::RentalInstrument> rental_instruments =
                controller->FetchAvailableRentalInstruments(instrument_type);
        if (!rental_instruments.empty()) {
            std::cout << "AVAILABLE RENTAL INSTRUMENTS:\n";
            std::cout << "Rental instrument id:\tBrand:\tMonthly fee:\tInstrument type:\n";
            for (auto &rental_instrument : rental_instruments) {
                std::cout << rental_instrument.getInstrumentId() << "\t";
                std::cout << rental_instrument.getBrand() << "\t";
                std::cout << rental_instrument.getMonthlyFee() << "\t";
                std::cout << rental_instrument.getInstrumentType() << "\n";
            }
        } else {
            std::cout << "Could not find any available rental instruments.\n";
        }
    }catch (integration::DatabaseError &error){
        std::cout << DATABASE_ERROR_PROMPT << "\n";
    }
}
void ViewSession::RentInstrument(){
    try{
        std::cout << "Enter the rental instrument id of what instrument you would like to rent.\n";
        std::string instrument_id;
        std::getline(std::cin, instrument_id);

        controller->RentInstrument(student_id, instrument_id);
        std::cout << "Successfully rented instrument: " << instrument_id << "\n";
    }catch(integration::DatabaseError &error){
        std::cout << DATABASE_ERROR_PROMPT << "\n";
    }catch(model::StudentNotEnrolledError &error){
        std::cout << STUDENT_NOT_ENROLLED_PROMPT << "\n";
    }catch(model::NumberAllowedRentalsExceededError &error){
        std::cout << EXCEEDED_RENTALS_EXCEEDED_PROMPT << "\n";
    }catch(model::InstrumentNotAvailableError &error){
        std::cout << INSTRUMENT_NOT_AVAILABLE_PROMPT << "\n";
    }
}
void ViewSession::TerminateRental(){
    try{
        std::cout << "Enter the id of the rental that you would like to terminate.\n";
        std::string input;
        std::getline(std::cin, input);
        int rental_id = std::atoi(input.c_str());

        controller->TerminateRental(rental_id, student_id);
        std::cout << "Successfully terminated rental with id: " << rental_id << "\n";
    }catch(integration::DatabaseError &error){
        std::cout << DATABASE_ERROR_PROMPT << "\n";
    }catch(model::RentalNotActiveError &error){
        std::cout << RENTAL_NOT_ACTIVE_PROMPT << "\n";
    }
}

} // namespace