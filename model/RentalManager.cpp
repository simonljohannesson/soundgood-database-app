#include "RentalManager.h"

namespace model{

std::vector<dto::RentalInstrument> RentalManager::RequestAvailableRentalInstruments(
        std::string instrument_type,
        integration::DbHandler& db_handler) {
    return db_handler.RequestAvailableRentalInstruments(instrument_type);
}

} // namespace