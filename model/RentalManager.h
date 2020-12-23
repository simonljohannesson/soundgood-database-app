#ifndef SOUNDGOOD_RENTALMANAGER_H
#define SOUNDGOOD_RENTALMANAGER_H

#include <vector>
#include "../dto/RentalInstrument.h"
#include "../integration/DbHandler.h"

namespace model {

class RentalManager {
public:
    RentalManager() = default;
    std::vector<dto::RentalInstrument>RequestAvailableRentalInstruments(
            std::string instrument_type,
            integration::DbHandler& db_handler);
};

} // namespace



#endif //SOUNDGOOD_RENTALMANAGER_H
