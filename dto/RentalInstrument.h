#ifndef SOUNDGOOD_RENTALINSTRUMENT_H
#define SOUNDGOOD_RENTALINSTRUMENT_H

#include <string>
#include <iostream>
namespace dto {

class RentalInstrument {
public:

    RentalInstrument(int id,
                     std::string instrument_id,
                     std::string brand,
                     std::string instrument_type,
                     int monthly_fee,
                     int max_lease_in_days);

    int getId() const;
    const std::string &getInstrumentId() const;

    const std::string &getBrand() const;

    const std::string &getInstrumentType() const;

    int getMonthlyFee() const;

    int getMaxLeaseInDays() const;

    friend std::ostream& operator<<(std::ostream& strm, const RentalInstrument& obj);
private:
    int id;
    std::string instrument_id;
    std::string brand;
    std::string instrument_type;
    int monthly_fee;
    int max_lease_in_days;
};

}// namespace

#endif //SOUNDGOOD_RENTALINSTRUMENT_H
