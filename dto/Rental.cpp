#include "Rental.h"

namespace dto {


Rental::Rental(
        int id,
        int studentId,
        int rentalInstrumentId,
        std::string startDate,
        std::string returnDate) :
        id(id),
        student_id(studentId),
        rental_instrument_id(rentalInstrumentId),
        start_date(std::move(startDate)),
        return_date(std::move(returnDate)) {}


int Rental::getId() const {
    return id;
}

int Rental::getStudentId() const {
    return student_id;
}

int Rental::getRentalInstrumentId() const {
    return rental_instrument_id;
}

const std::string &Rental::getStartDate() const {
    return start_date;
}

const std::string &Rental::getReturnDate() const {
    return return_date;
}

} // namespace