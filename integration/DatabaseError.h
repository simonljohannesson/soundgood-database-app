#ifndef SOUNDGOOD_DATABASEERROR_H
#define SOUNDGOOD_DATABASEERROR_H

#include <stdexcept>

namespace integration {

class DatabaseError : public std::runtime_error{
    using std::runtime_error::runtime_error;
};

} // namespace

#endif //SOUNDGOOD_DATABASEERROR_H
