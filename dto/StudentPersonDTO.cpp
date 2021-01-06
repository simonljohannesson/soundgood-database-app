#include "StudentPersonDTO.h"

#include <utility>

namespace dto {

StudentPersonDTO::StudentPersonDTO(
        int person_id,
        std::string person_number,
        std::string first_name,
        std::string surname,
        std::string street,
        std::string zip_code,
        std::string city,
        std::string phone_number,
        std::string email,
        int student_id,
        std::string user_name,
        bool enrolled,
        bool should_save_application,
        int school_id,
        std::string date_enrolled)
        :
        person_id(person_id),
        person_number(std::move(person_number)),
        first_name(std::move(first_name)),
        surname(std::move(surname)),
        street(std::move(street)),
        zip_code(std::move(zip_code)),
        city(std::move(city)),
        phone_number(std::move(phone_number)),
        email(std::move(email)),
        student_id(student_id),
        user_name(std::move(user_name)),
        enrolled(enrolled),
        should_save_application(should_save_application),
        school_id(school_id),
        date_enrolled(std::move(date_enrolled)) {}

int StudentPersonDTO::getPersonId() const {
    return person_id;
}

const std::string &StudentPersonDTO::getPersonNumber() const {
    return person_number;
}

const std::string &StudentPersonDTO::getFirstName() const {
    return first_name;
}

const std::string &StudentPersonDTO::getSurname() const {
    return surname;
}

const std::string &StudentPersonDTO::getStreet() const {
    return street;
}

const std::string &StudentPersonDTO::getZipCode() const {
    return zip_code;
}

const std::string &StudentPersonDTO::getCity() const {
    return city;
}

const std::string &StudentPersonDTO::getPhoneNumber() const {
    return phone_number;
}

const std::string &StudentPersonDTO::getEmail() const {
    return email;
}

int StudentPersonDTO::getStudentId() const {
    return student_id;
}

const std::string &StudentPersonDTO::getUserName() const {
    return user_name;
}

bool StudentPersonDTO::isEnrolled() const {
    return enrolled;
}

bool StudentPersonDTO::isShouldSaveApplication() const {
    return should_save_application;
}

int StudentPersonDTO::getSchoolId() const {
    return school_id;
}

const std::string &StudentPersonDTO::getDateEnrolled() const {
    return date_enrolled;
}
} // namespace