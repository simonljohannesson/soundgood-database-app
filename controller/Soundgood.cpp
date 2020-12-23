#include "Soundgood.h"
namespace controller {

Soundgood::Soundgood(std::string database_config): db_handler{database_config} {

}

std::vector<dto::RentalInstrument> Soundgood::FetchAvailableRentalInstruments(std::string instrument_type) {
    // TODO: catch all exceptions, log and rethrow?
    return rental_manager.RequestAvailableRentalInstruments(instrument_type,db_handler);
}



}// namespace