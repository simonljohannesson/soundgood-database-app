#include "ActiveRental.h"

namespace dto{

const Rental &ActiveRental::getRental() {
    return rental;
}

const RentalInstrument &ActiveRental::getRentalInstrument() {
    return rental_instrument;
}

}// namespace