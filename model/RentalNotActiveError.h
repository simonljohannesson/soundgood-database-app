#ifndef SOUNDGOOD_RENTALNOTACTIVEERROR_H
#define SOUNDGOOD_RENTALNOTACTIVEERROR_H

#include <stdexcept>

class RentalNotActiveError : public std::runtime_error{
public:
    using runtime_error::runtime_error;
};


#endif //SOUNDGOOD_RENTALNOTACTIVEERROR_H
