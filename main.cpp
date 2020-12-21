#include <iostream>
#include <pqxx/pqxx>

/**
 * Executes a simple SQL query on the soundgood database.
 * @param conn the pqxx::connection opened to the database
 */
void try_query(pqxx::connection &conn){
    try{
        pqxx::work work{conn};
        pqxx::result result {work.exec("SELECT * FROM sibling;")};
        for(auto row : result){
            std::cout <<  row[0] << " " << row[1] << "\n";
        }
        work.commit(); // not needed but good practice to end the transaction
    } catch (pqxx::sql_error &e) {
        std::cout << e.what() << "\n" << e.sqlstate() << "\n";
    }
}



int main() {
    std::cout << "Hello, World!" << std::endl;

    try {
        pqxx::connection c ("dbname=soundgood user=postgres password=password hostaddr=127.0.0.1 port=5432");
        std::cout << "Connected to database: " << (c.is_open() ? "True" : "False") << "\n";

        try_query(c);

        c.close();
    }catch (pqxx::failure &e) {
        std::cout << e.what() << "\n";
    };

    return 0;
}
