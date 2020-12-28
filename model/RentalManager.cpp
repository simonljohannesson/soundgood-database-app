#include "RentalManager.h"
#include "NumberAllowedRentalsExceededError.h"
#include "InstrumentNotAvailableError.h"
#include "StudentNotEnrolledError.h"

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

} // namespace