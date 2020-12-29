#include "RentalManager.h"
#include "NumberAllowedRentalsExceededError.h"
#include "InstrumentNotAvailableError.h"
#include "StudentNotEnrolledError.h"
#include "RentalNotActiveError.h"
#include "../dto/ActiveRental.h"

namespace model{

std::vector<dto::RentalInstrument> RentalManager::RequestAvailableRentalInstruments(
            std::string instrument_type,
            integration::DbHandler& db_handler) {
    return db_handler.RequestAvailableRentalInstruments(instrument_type);
}

void RentalManager::RentInstrument(
            int student_id,
            const std::string& instrument_id,
            integration::DbHandler& db_handler){
    bool student_enrolled = db_handler.StudentIsEnrolled(student_id);
    if (!student_enrolled){
        throw StudentNotEnrolledError(
                "Student with id: " + std::to_string(student_id) + " not enrolled.");
    }

    int active_rentals = db_handler.NumberOfActiveRentals(student_id);
    if (active_rentals >= 2) {
        throw NumberAllowedRentalsExceededError(
                "Too many instruments already rented by student.");
    }

    bool instrument_available = db_handler.RentalInstrumentIsAvailable(instrument_id);
    if (!instrument_available){
        throw InstrumentNotAvailableError(
                "Instrument with identifier " + instrument_id + " is not available.");
    }

    // prerequisites for renting selected instrument met
    db_handler.SetRentalInstrumentRented(student_id, instrument_id);
}

void RentalManager::TerminateRental(int rental_id,
                                   int student_id,
                                   integration::DbHandler& db_handler){
     bool rental_active = db_handler.RentalIsActive(rental_id, student_id);
     if(!rental_active){
         throw RentalNotActiveError(
                 "Could not find any active rental with id: "
                 + std::to_string(rental_id)
                 + " and student id: "
                 + std::to_string(student_id));
     }
     else{
         db_handler.TerminateRental(rental_id);
     }
}

std::vector<dto::ActiveRental> RentalManager::GetActiveRentals(
        int student_id,
        integration::DbHandler &db_handler){
    return db_handler.GetActiveRentals(student_id);
}

int RentalManager::GetStudentIdFromUsername(
        const std::string &username, integration::DbHandler &db_handler){
    return db_handler.GetStudentIdFromUsername(username);
}

} // namespace