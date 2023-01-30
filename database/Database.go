package database

import (
	"ConsocioAccion/models"
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

func Connect() (db *sql.DB, e error) {
	user := "root"
	pass := "toor"
	host := "tcp(127.0.0.1:3306)"
	database := "consorcio"

	db, err := sql.Open("mysql", fmt.Sprintf("%s:%s@%s/%s", user, pass, host, database))

	if err != nil {
		return nil, err
	}

	err = db.Ping()
	if err != nil {
		fmt.Printf("Error conectando: %v", err)
		return nil, err
	}

	return db, nil
}

func Insert(request string, args ...any) *string {

	db, err := Connect()

	var e string

	if err != nil {
		e = err.Error()
		return &e
	}
	defer db.Close()

	query, err := db.Prepare(request)

	if err != nil {
		e = err.Error()
		return &e
	}

	defer query.Close()

	_, err = query.Exec(args...)

	if err != nil {
		e = err.Error()
		return &e
	}

	return nil
}

func SelectEmployee(request string) (models.Employee, *string) {

	var e string
	var user models.Employee
	db, err := Connect()
	if err != nil {
		e = err.Error()
		return user, &e
	}
	defer db.Close()

	rows, err := db.Query(request)
	if err != nil {
		e = err.Error()
		return user, &e
	}

	defer rows.Close()

	for rows.Next() {
		err = rows.Scan(&user.Id_employee, &user.Name_employee, &user.Lastname_employee, &user.Email_employee, &user.Position_employee, &user.Password_employee, &user.Permissions)
		if err != nil {
			fmt.Println(err.Error())
		}
	}
	//rows.Scan(employee.Id_employee, employee.Name_employee, employee.Lastname_employee)

	return user, nil

}

/*
func SelectCLients()([]models.Client,*string){

}
*/
