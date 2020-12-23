#include <iostream>
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

std::ostream &operator<<(std::ostream &strm, const Rental &obj){
    strm << "id: "                      << obj.id << "\t";
    strm << "student_id: "              << obj.student_id << "\t";
    strm << "rental_instrument_id: "    << obj.rental_instrument_id << "\t";
    strm << "start_date: "              << obj.start_date << "\t";
    strm << "return_date: "             << obj.return_date << "\t";
}

} // namespace