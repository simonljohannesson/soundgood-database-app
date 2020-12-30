#ifndef SOUNDGOOD_STUDENTNOTENROLLEDERROR_H
#define SOUNDGOOD_STUDENTNOTENROLLEDERROR_H

#include <stdexcept>

namespace model {

class StudentNotEnrolledError : public std::runtime_error {
public:
    // constructor inheritance
    using runtime_error::runtime_error;
};
}

#endif //SOUNDGOOD_STUDENTNOTENROLLEDERROR_H
