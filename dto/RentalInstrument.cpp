#include "RentalInstrument.h"

namespace dto {

RentalInstrument::RentalInstrument(
        int id,
        std::string&& instrument_id,
        std::string&& brand,
        std::string&& instrument_type,
        int monthly_fee,
        int max_lease_in_days):

        id{id},
        instrument_id{std::move(instrument_id)},
        brand{std::move(brand)},
        instrument_type{std::move(instrument_type)},
        monthly_fee{monthly_fee},
        max_lease_in_days{max_lease_in_days}
{};


int RentalInstrument::getId() const {
    return id;
}

const std::string &RentalInstrument::getInstrumentId() const {
    return instrument_id;
}

const std::string &RentalInstrument::getBrand() const {
    return brand;
}

const std::string &RentalInstrument::getInstrumentType() const {
    return instrument_type;
}

int RentalInstrument::getMonthlyFee() const {
    return monthly_fee;
}

int RentalInstrument::getMaxLeaseInDays() const {
    return max_lease_in_days;
}

std::ostream &operator<<(std::ostream &strm, const RentalInstrument &obj) {
    strm << "id: "                      << obj.id << "\t";
    strm << "instrument_id: "           << obj.instrument_id << "\t";
    strm << "brand: "                   << obj.brand << "\t";
    strm << "instrument_type: "         << obj.instrument_type << "\t";
    strm << "monthly_fee: "             << obj.monthly_fee << "\t";
    strm << "max_lease_in_days: "       << obj.max_lease_in_days << "\t";
    return strm;
}


} // namespace