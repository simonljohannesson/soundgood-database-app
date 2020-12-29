#include "Soundgood.h"

namespace controller {

Soundgood::Soundgood(const std::string& database_config){
    db_handler = std::make_shared<integration::DbHandler>(database_config);
}

std::vector<dto::RentalInstrument> Soundgood::FetchAvailableRentalInstruments(const std::string& instrument_type) {
    return rental_manager.RequestAvailableRentalInstruments(instrument_type,db_handler);
}

void Soundgood::RentInstrument(int student_id, const std::string& instrument_identifier){
    rental_manager.RentInstrument(student_id, instrument_identifier, db_handler);
}

void Soundgood::TerminateRental(int rental_id, int student_id){
    rental_manager.TerminateRental(rental_id, student_id, db_handler);
}

std::vector<dto::ActiveRental> Soundgood::GetActiveRentals(int student_id){
    return rental_manager.GetActiveRentals(student_id, db_handler);
}

int Soundgood::GetStudentIdFromUsername(std::string username){
    return rental_manager.GetStudentIdFromUsername(username, db_handler);
}

}// namespace