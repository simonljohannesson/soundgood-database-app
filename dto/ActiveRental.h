#ifndef SOUNDGOOD_ACTIVERENTAL_H
#define SOUNDGOOD_ACTIVERENTAL_H

#include "Rental.h"
#include "RentalInstrument.h"

namespace dto {

class ActiveRental {
private:
    const Rental rental;
    const RentalInstrument rental_instrument;
public:
    ActiveRental(Rental rental, RentalInstrument rental_instrument):
            rental{std::move(rental)}, rental_instrument{std::move(rental_instrument)}{};
    const dto::Rental& getRental();
    const dto::RentalInstrument& getRentalInstrument();
};

}


#endif //SOUNDGOOD_ACTIVERENTAL_H
