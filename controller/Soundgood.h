#ifndef SOUNDGOOD_SOUNDGOOD_H
#define SOUNDGOOD_SOUNDGOOD_H

#include "../integration/DbHandler.h"
#include "../model/RentalManager.h"

namespace controller {

class Soundgood {
private:
    integration::DbHandler db_handler;
    model::RentalManager rental_manager;
public:
    Soundgood(std::string database_config); // model access
    std::vector<dto::RentalInstrument>FetchAvailableRentalInstruments(std::string instrument_type);
};

} // namespace
#endif //SOUNDGOOD_SOUNDGOOD_H
