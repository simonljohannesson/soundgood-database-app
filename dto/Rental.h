#ifndef SOUNDGOOD_RENTAL_H
#define SOUNDGOOD_RENTAL_H

#include <string>

namespace dto {


class Rental {
public:
    Rental(int id,
           int studentId,
           int rentalInstrumentId,
           std::string startDate,
           std::string returnDate);

    int id;
    int getId() const;

    int getStudentId() const;

    int getRentalInstrumentId() const;

    const std::string &getStartDate() const;

    const std::string &getReturnDate() const;

    friend std::ostream &operator<<(std::ostream &strm, const Rental &obj);

private:
    int student_id;
    int rental_instrument_id;
    std::string start_date;
    std::string return_date;

};

} // namespace
#endif //SOUNDGOOD_RENTAL_H
