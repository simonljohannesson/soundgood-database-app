#include "StudentPersonDTO.h"

namespace dto {

StudentPersonDTO::StudentPersonDTO(
        int personId,
        std::string personNumber,
        std::string firstName,
        std::string surname,
        std::string street,
        std::string zipCode,
        std::string city,
        std::string phoneNumber,
        std::string email,
        int studentId, const std::string &userName,
        bool enrolled,
        bool shouldSaveApplication,
        int schoolId,
        const std::string &dateEnrolled)
        :
        person_id(personId),
        person_number(std::move(personNumber)),
        first_name(std::move(firstName)),
        surname(std::move(surname)),
        street(std::move(street)),
        zip_code(std::move(zipCode)),
        city(std::move(city)),
        phone_number(std::move(phoneNumber)),
        email(std::move(email)),
        student_id(studentId),
        user_name(userName),
        enrolled(enrolled),
        should_save_application(shouldSaveApplication),
        school_id(schoolId),
        date_enrolled(dateEnrolled) {}

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