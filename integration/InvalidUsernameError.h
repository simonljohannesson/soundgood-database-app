#ifndef SOUNDGOOD_INVALIDUSERNAMEERROR_H
#define SOUNDGOOD_INVALIDUSERNAMEERROR_H


#include <stdexcept>

namespace integration {

class InvalidUsernameError : public std::runtime_error {
    using std::runtime_error::runtime_error;
};

}


#endif //SOUNDGOOD_INVALIDUSERNAMEERROR_H
