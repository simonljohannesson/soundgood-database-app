#ifndef SOUNDGOOD_STUDENTPERSONDTO_H
#define SOUNDGOOD_STUDENTPERSONDTO_H

#include <string>

namespace dto {

class StudentPersonDTO {
private:
    int person_id;
    std::string person_number;
    std::string first_name;
    std::string surname;
    std::string street;
    std::string zip_code;
    std::string city;
    std::string phone_number;
    std::string email;
    int student_id;
    std::string user_name;
    bool enrolled;
    bool should_save_application;
    int school_id;
    std::string date_enrolled;
public:
    StudentPersonDTO(
            int person_id,
            std::string person_number,
            std::string first_name,
            std::string surname,
            std::string street,
            std::string zip_code,
            std::string city,
            std::string phone_number,
            std::string email,
            int student_id, std::string user_name,
            bool enrolled,
            bool should_save_application,
            int school_id,
            std::string date_enrolled);

    int getPersonId() const;

    const std::string &getPersonNumber() const;

    const std::string &getFirstName() const;

    const std::string &getSurname() const;

    const std::string &getStreet() const;

    const std::string &getZipCode() const;

    const std::string &getCity() const;

    const std::string &getPhoneNumber() const;

    const std::string &getEmail() const;

    int getStudentId() const;

    const std::string &getUserName() const;

    bool isEnrolled() const;

    bool isShouldSaveApplication() const;

    int getSchoolId() const;

    const std::string &getDateEnrolled() const;
};

} // namespace

#endif //SOUNDGOOD_STUDENTPERSONDTO_H
