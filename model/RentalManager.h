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

    void RentInstrument(int student_id, const std::string &instrument_id, integration::DbHandler &db_handler);

    void TerminateRental(int rental_id, int student_id, integration::DbHandler& db_handler);

    std::vector<dto::ActiveRental> GetActiveRentals(int student_id, integration::DbHandler &db_handler);

    int GetStudentIdFromUsername(const std::string &username, integration::DbHandler &db_handler);
};

} // namespace



#endif //SOUNDGOOD_RENTALMANAGER_H
