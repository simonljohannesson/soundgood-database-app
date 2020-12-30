#ifndef SOUNDGOOD_NUMBERALLOWEDRENTALSEXCEEDEDERROR_H
#define SOUNDGOOD_NUMBERALLOWEDRENTALSEXCEEDEDERROR_H

#include <stdexcept>

namespace model {

class NumberAllowedRentalsExceededError : public std::runtime_error {
public:
    // constructor inheritance
    using runtime_error::runtime_error;
};
}

#endif //SOUNDGOOD_NUMBERALLOWEDRENTALSEXCEEDEDERROR_H
