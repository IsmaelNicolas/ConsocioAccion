package database

import (
	"ConsocioAccion/models"
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
)

func Connect() (db *sql.DB, e error) {
	user := "prod"
	pass := "dorp"
	host := "tcp(toorblue.com)"
	database := "inmobiliaria"

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
		fmt.Println(err)
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
	defer rows.Close()

	if err != nil {
		e = err.Error()
		return user, &e
	}

	var emp_id_employee sql.NullString

	for rows.Next() {
		err = rows.Scan(&user.Id_employee, &emp_id_employee, &user.Name_employee, &user.Lastname_employee, &user.Email_employee, &user.Position_employee, &user.Password_employee, &user.Permissions)
		if err != nil {
			fmt.Println(err.Error())
		}
		if emp_id_employee.Valid {
			user.Emp_Id_employee = emp_id_employee.String
		} else {
			user.Emp_Id_employee = ""
		}
	}
	//rows.Scan(employee.Id_employee, employee.Name_employee, employee.Lastname_employee)

	return user, nil

}

func SelectCLients(request string) ([]models.Client, *string) {
	var e string
	var client models.Client
	var clients []models.Client

	db, err := Connect()
	if err != nil {
		e = err.Error()
		return nil, &e
	}
	defer db.Close()

	rows, err := db.Query(request)

	if err != nil {
		e = err.Error()
		return nil, &e
	}
	defer rows.Close()

	for rows.Next() {
		err = rows.Scan(&client.Id_client, &client.Name_client, &client.Lastname_client, &client.Phone_client, &client.Email_client, &client.Marital_status_client, &client.Direction_client)
		if err != nil {
			fmt.Println(err.Error())
		}
		clients = append(clients, client)
	}

	return clients, nil

}

func SelectSpouse(request string) ([]models.Client, *string) {
	var e string
	var client models.Client
	var clients []models.Client

	db, err := Connect()
	if err != nil {
		e = err.Error()
		return nil, &e
	}
	defer db.Close()

	rows, err := db.Query(request)

	if err != nil {
		e = err.Error()
		return nil, &e
	}
	defer rows.Close()

	var spouseName sql.NullString
	var spouseOcupation sql.NullString
	var spouseDirection sql.NullString
	var spouseEntity sql.NullString
	var spouseSalary sql.NullFloat64

	for rows.Next() {
		err = rows.Scan(&client.Id_client, &spouseName, &spouseOcupation, &spouseDirection, &spouseSalary, &spouseEntity)
		if err != nil {
			fmt.Println(err.Error())
		}
		if spouseName.Valid {
			client.Spouse_name = spouseName.String
			client.Spouse_direction = spouseDirection.String
			client.Spouse_entity = spouseEntity.String
			client.Spouse_ocupation = spouseOcupation.String
			client.Spouse_salary = float32(spouseSalary.Float64)
		} else {
			client.Spouse_name = "-"
			client.Spouse_direction = "-"
			client.Spouse_entity = "-"
			client.Spouse_ocupation = "-"
			client.Spouse_salary = 0
		}

		clients = append(clients, client)
	}

	return clients, nil

}
func SelectEconomic(request string) ([]models.Client, *string) {
	var e string
	var client models.Client
	var clients []models.Client

	db, err := Connect()
	if err != nil {
		e = err.Error()
		return nil, &e
	}
	defer db.Close()

	rows, err := db.Query(request)

	if err != nil {
		e = err.Error()
		return nil, &e
	}
	defer rows.Close()

	var entity sql.NullString
	var ocupation sql.NullString
	var direction sql.NullString
	var salary sql.NullFloat64

	for rows.Next() {
		err = rows.Scan(&ocupation, &salary, &entity, &direction)
		if err != nil {
			fmt.Println(err.Error())
		}
		if ocupation.Valid {
			client.Ocupation_client = ocupation.String
			client.Direction_entity = direction.String
			client.Entity_name = entity.String
			client.Salary_client = float32(salary.Float64)
		} else {
			client.Ocupation_client = "-"
			client.Direction_entity = "-"
			client.Entity_name = "-"
			client.Salary_client = 0
		}

		clients = append(clients, client)
	}

	return clients, nil

}

func SelectStage(request string) ([]models.Stage, *string) {
	var e string
	var stage models.Stage
	var stages []models.Stage

	db, err := Connect()
	if err != nil {
		e = err.Error()
		return nil, &e
	}
	defer db.Close()

	rows, err := db.Query(request)

	if err != nil {
		e = err.Error()
		return nil, &e
	}
	defer rows.Close()

	for rows.Next() {
		err = rows.Scan(&stage.Name_stage, &stage.Stage_start_date, &stage.Stage_end_date, &stage.Precondition_stage)
		if err != nil {
			e = err.Error()
			return nil, &e
		}
		stages = append(stages, stage)
	}

	fmt.Println(stages)

	return stages, nil

}

func SelectEmployees(request string) ([]models.Employee, *string) {

	var e string
	var emp models.Employee
	var emps []models.Employee

	db, err := Connect()
	if err != nil {
		e = err.Error()
		return emps, &e
	}
	defer db.Close()

	rows, err := db.Query(request)
	defer rows.Close()

	if err != nil {
		e = err.Error()
		return emps, &e
	}

	var emp_id_employee sql.NullString

	for rows.Next() {
		err = rows.Scan(&emp.Id_employee, &emp_id_employee, &emp.Name_employee, &emp.Lastname_employee)
		if err != nil {
			fmt.Println(err.Error())
		}
		if emp_id_employee.Valid {
			emp.Emp_Id_employee = emp_id_employee.String
		} else {
			emp.Emp_Id_employee = ""
		}
		emps = append(emps, emp)
	}
	//rows.Scan(employee.Id_employee, employee.Name_employee, employee.Lastname_employee)

	return emps, nil

}
