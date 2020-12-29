#ifndef SOUNDGOOD_SOUNDGOOD_H
#define SOUNDGOOD_SOUNDGOOD_H

#include "../integration/DbHandler.h"
#include "../model/RentalManager.h"
#include <memory>

namespace controller {

class Soundgood {
private:
    std::shared_ptr<integration::DbHandler> db_handler;
    model::RentalManager rental_manager;
public:
    Soundgood(const std::string& database_config); // model access
    std::vector<dto::RentalInstrument>FetchAvailableRentalInstruments(
            const std::string& instrument_type);

    void RentInstrument(int student_id, const std::string &instrument_identifier);

    void TerminateRental(int rental_id, int student_id);

    std::vector<dto::ActiveRental> GetActiveRentals(int student_id);

    int GetStudentIdFromUsername(std::string username);
};

} // namespace
#endif //SOUNDGOOD_SOUNDGOOD_H
