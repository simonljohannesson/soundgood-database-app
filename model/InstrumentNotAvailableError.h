#ifndef SOUNDGOOD_INSTRUMENTNOTAVAILABLEERROR_H
#define SOUNDGOOD_INSTRUMENTNOTAVAILABLEERROR_H

#include <iostream>

class InstrumentNotAvailableError : public std::runtime_error {
public:
    // constructor inheritance
    using std::runtime_error::runtime_error;
};


#endif //SOUNDGOOD_INSTRUMENTNOTAVAILABLEERROR_H
