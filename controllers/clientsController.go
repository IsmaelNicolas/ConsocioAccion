package controllers

import (
	"ConsocioAccion/database"
	"ConsocioAccion/models"
	"fmt"
	"strconv"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
)

func GetEmployees(c *fiber.Ctx) error {

	request := "SELECT ID_EMPLOYEE, EMP_ID_EMPLOYEE, NAME_EMPLOYEE, LASTNAME_EMPLOYEE FROM employee WHERE POSITION_EMPLOYEE  = 'emp' OR POSITION_EMPLOYEE  = 'jefe' ORDER BY CASE WHEN POSITION_EMPLOYEE  = 'jefe' THEN ID_EMPLOYEE ELSE EMP_ID_EMPLOYEE end;"
	emps, er := database.SelectEmployees(request)

	if er != nil {
		c.Status(fiber.StatusBadRequest)
		return c.JSON(fiber.Map{
			"message": er,
		})
	}

	c.Status(fiber.StatusOK)
	c.Type("json")
	return c.JSON(emps)

}

func GetClients(c *fiber.Ctx) error {

	cookie := c.Cookies("jwt")

	token, err := jwt.ParseWithClaims(cookie, &jwt.StandardClaims{}, func(token *jwt.Token) (interface{}, error) {
		return []byte(SecretKey), nil
	})

	if err != nil {
		c.Status(fiber.StatusUnauthorized)
		return c.JSON(fiber.Map{
			"message": "unauthenticated",
		})
	}

	claims := token.Claims.(*jwt.StandardClaims)

	var clients []models.Client

	request := "SELECT ID_CLIENT,  NAME_CLIENT, LASTNAME_CLIENT, PHONE_CLIENT  , CITY_SUBSCRIBE,EMAIL_CLIENT, MARITAL_STATUS_CLIENT, DIRECTION_CLIENT FROM  client WHERE id_employee = '" + claims.Issuer + "';"
	clients, er := database.SelectCLients(request)

	if er != nil {
		c.Status(fiber.StatusBadRequest)
		return c.JSON(fiber.Map{
			"message": er,
		})
	}

	return c.JSON(clients)
}

func GetClient(c *fiber.Ctx) error {

	cookie := c.Cookies("jwt")

	_, err := jwt.ParseWithClaims(cookie, &jwt.StandardClaims{}, func(token *jwt.Token) (interface{}, error) {
		return []byte(SecretKey), nil
	})

	if err != nil {
		c.Status(fiber.StatusUnauthorized)
		return c.JSON(fiber.Map{
			"message": "unauthenticated",
		})
	}

	id_client := c.Params("id")
	fmt.Println(id_client)
	request := "SELECT ID_CLIENT,  NAME_CLIENT, LASTNAME_CLIENT, PHONE_CLIENT ,EMAIL_CLIENT, MARITAL_STATUS_CLIENT, DIRECTION_CLIENT FROM  client WHERE id_client = '" + id_client + "';"
	client, er := database.SelectCLients(request)

	if er != nil {
		c.Status(fiber.StatusBadRequest)
		return c.JSON(fiber.Map{
			"message": er,
		})
	}

	return c.JSON(client)
}

func GetSpouseClient(c *fiber.Ctx) error {
	id_client := c.Params("id")

	request := "SELECT ID_CLIENT,SPOUSE_NAME, SPOUSE_OCUPATION, SPOUSE_DIRECTION, SPOUSE_SALARY, SPOUSE_ENTITY  FROM client where ID_CLIENT =" + id_client + ";"
	client, er := database.SelectSpouse(request)

	if er != nil {
		c.Status(fiber.StatusBadRequest)
		return c.JSON(fiber.Map{
			"message": er,
		})
	}

	if len(client) > 0 {
		return c.JSON(client[0])
	} else {
		c.Status(fiber.StatusNotFound)
		return c.JSON(fiber.Map{
			"message": nil,
		})
	}
}

func GetStageClient(c *fiber.Ctx) error {

	id_client := c.Params("id")

	request := "SELECT stage.NAME_STAGE, stage_client.STAGE_START_DATE, stage_client.STAGE_END_DATE,stage_client.CONDITIONS FROM stage_client  JOIN stage ON stage.ID_STAGE = stage_client.ID_STAGE where stage_client.ID_CLIENT = " + id_client + ";"

	stages, er := database.SelectStage(request)

	if er != nil {
		c.Status(fiber.StatusBadRequest)
		return c.JSON(fiber.Map{
			"message": er,
		})
	}

	return c.JSON(stages)

}

func GetEconomicClient(c *fiber.Ctx) error {
	id_client := c.Params("id")
	request := "SELECT  OCUPATION_CLIENT, SALARY_CLIENT, ENTITY_CLIENT, DIRECTION_ENTITY FROM client WHERE ID_CLIENT=" + id_client + ";"

	client, er := database.SelectEconomic(request)

	if er != nil {
		c.Status(fiber.StatusBadRequest)
		return c.JSON(fiber.Map{
			"message": er,
		})
	}

	return c.JSON(client)
}

func InsertClient(c *fiber.Ctx) error {

	cookie := c.Cookies("jwt")

	token, err := jwt.ParseWithClaims(cookie, &jwt.StandardClaims{}, func(token *jwt.Token) (interface{}, error) {
		return []byte(SecretKey), nil
	})

	if err != nil {
		c.Status(fiber.StatusUnauthorized)
		return c.JSON(fiber.Map{
			"message": "unauthenticated",
		})
	}

	claims := token.Claims.(*jwt.StandardClaims)

	var data map[string]string

	if err := c.BodyParser(&data); err != nil {
		return err
	}

	client := models.Client{
		Id_client:             data["id_client"],
		Name_client:           data["name_client"],
		Lastname_client:       data["lastName_client"],
		Phone_client:          data["phone_client"],
		Email_client:          data["email_client"],
		Direction_client:      data["direction_client"],
		Marital_status_client: data["status_client"],
	}

	fmt.Println(data)
	fmt.Println(client)

	request := "INSERT INTO client (ID_CLIENT, NAME_CLIENT, LASTNAME_CLIENT, PHONE_CLIENT, EMAIL_CLIENT, DIRECTION_CLIENT, MARITAL_STATUS_CLIENT) VALUES(?, ?, ?, ?, ?,?,?);"

	er := database.Insert(request, client.Id_client, client.Name_client, client.Lastname_client, client.Phone_client, client.Email_client, client.Direction_client, client.Marital_status_client)

	if er != nil {
		c.Status(fiber.StatusInternalServerError)
		return c.JSON(fiber.Map{
			"message": er,
		})
	}

	fmt.Println(claims.Issuer)

	request = "INSERT INTO subscribe (ID_EMPLOYEE, ID_CLIENT, DATE_SUBSCRIBE, CITY_SUBSCRIBE) VALUES(?,?,current_date(), ?);"
	er = database.Insert(request, claims.Issuer, client.Id_client, data["city_client"])
	if er != nil {
		c.Status(fiber.StatusInternalServerError)
		return c.JSON(fiber.Map{
			"message": er,
		})
	}

	return c.JSON(client)

}

func addThreeMonths(dateString ...string) string {
	var inputDate time.Time
	if len(dateString) > 0 {
		parsedDate, err := time.Parse("2006/01/02", dateString[0])
		if err != nil {
			return "Invalid date format. Use YYYY/MM/DD."
		}
		inputDate = parsedDate
	} else {
		inputDate = time.Now()
	}
	newDate := inputDate.AddDate(0, 3, 0)
	return newDate.Format("2006/01/02")
}

func InsertDataCLient(c *fiber.Ctx) error {
	var data map[string]string

	if err := c.BodyParser(&data); err != nil {
		return err
	}

	spouseSalary, err := strconv.ParseFloat(data["spouse_salary"], 32)
	if err != nil {
		fmt.Println(err)
		c.Status(fiber.StatusBadRequest)
		return c.JSON(fiber.Map{
			"message": "bad data",
		})
	}

	clientSalary, err := strconv.ParseFloat(data["client_salary"], 32)
	if err != nil {
		fmt.Println(err)
		c.Status(fiber.StatusBadRequest)
		return c.JSON(fiber.Map{
			"message": "bad data",
		})
	}

	spouse := models.Client{
		Spouse_name:      data["spouse_lastname"],
		Spouse_ocupation: data["spouse_ocupation"],
		Spouse_direction: data["spouse_direction"],
		Spouse_salary:    float32(spouseSalary),
		Spouse_entity:    data["spouse_entity"],
		Ocupation_client: data["client_ocupation"],
		Salary_client:    float32(clientSalary),
		Entity_client:    data["client_entity"],
		Direction_entity: data["entity_direction"],
		Entity_name:      data["client_entity"],
	}

	request := "UPDATE client set SPOUSE_NAME = ?, SPOUSE_OCUPATION = ?, SPOUSE_DIRECTION = ?, SPOUSE_SALARY = ?, SPOUSE_ENTITY = ?,OCUPATION_CLIENT= ?,SALARY_CLIENT= ?,ENTITY_CLIENT= ?,DIRECTION_ENTITY= ? WHERE id_client = " + data["id_client"] + ";"

	er := database.Insert(request, spouse.Spouse_name, spouse.Spouse_ocupation, spouse.Spouse_direction, spouse.Spouse_salary, spouse.Spouse_entity, spouse.Ocupation_client, spouse.Salary_client, spouse.Entity_client, spouse.Direction_entity)
	if er != nil {
		c.Status(fiber.StatusInternalServerError)
		return c.JSON(fiber.Map{
			"message": er,
		})
	}

	request = "INSERT INTO property (ID_CLIENT, ID_PROPERTY, TYPE_PROPERTY,NEIGHBORHOOD) VALUES(?, uuid() , ?,?);"
	er = database.Insert(request, data["id_client"], data["type_property"], data["property_direction"])
	if er != nil {
		c.Status(fiber.StatusInternalServerError)
		return c.JSON(fiber.Map{
			"message": er,
		})
	}

	request = "INSERT INTO payment (ID_CLIENT, ID_PROPERTY, ID_PAYMENT, DESCRIPTION_PAYMENT, DATE_PAYMENT,VALUE_PAYMENT) VALUES(?, (select ID_PROPERTY from property where ID_CLIENT= ?), uuid(), 'Reservacion', current_date(),?);"
	er = database.Insert(request, data["id_client"], data["id_client"], data["payment"])
	if er != nil {
		c.Status(fiber.StatusInternalServerError)
		return c.JSON(fiber.Map{
			"message": er,
		})
	}

	dates := make([]string, 7)

	for i := 0; i < 7; i++ {

		if i == 0 {
			dates[i] = addThreeMonths()
		} else {
			dates[i] = addThreeMonths(dates[i-1])
		}

	}
	for i := 0; i < len(dates)-1; i++ {
		request = "INSERT INTO stage_client (ID_CLIENT, ID_STAGE, STAGE_START_DATE, STAGE_END_DATE,CONDITIONS) VALUES(?,?, ?, ?,0);"
		er = database.Insert(request, data["id_client"], i+1, dates[i], dates[i+1])
		if er != nil {
			c.Status(fiber.StatusInternalServerError)
			return c.JSON(fiber.Map{
				"message": er,
			})
		}
	}

	return c.JSON(data)
}
