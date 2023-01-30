package controllers

import (
	"ConsocioAccion/database"
	"ConsocioAccion/models"
	"ConsocioAccion/utils"
	"time"

	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
	uuid "github.com/satori/go.uuid"
)

const SecretKey = "secret"

func Register(c *fiber.Ctx) error {
	var data map[string]string

	if err := c.BodyParser(&data); err != nil {
		return err
	}

	password := utils.GennerateSHA3(data["password_employee"])

	user := models.Employee{
		Id_employee:       uuid.NewV4().String(),
		Name_employee:     data["name_employee"],
		Lastname_employee: data["lastname_employee"],
		Email_employee:    data["email_employee"],
		Position_employee: data["position_employee"],
		Password_employee: password,
		Permissions:       data["permissions"],
	}

	request := "INSERT INTO consorcio.employee (ID_EMPLOYEE, NAME_EMPLOYEE, LASTNAME_EMPLOYEE, EMAIL_EMPLOYEE, POSITION_EMPLOYEE, PASSWORD_EMPLOYEE, PERMISSIONS) VALUES(?, ?, ?, ?, ?, ?, ?);"

	err := database.Insert(request, user.Id_employee, user.Name_employee, user.Lastname_employee, user.Email_employee, user.Position_employee, user.Password_employee, user.Permissions)
	if err != nil {
		c.Status(fiber.StatusInternalServerError)
		return c.JSON(fiber.Map{
			"message": err,
		})
	}

	return c.JSON(user)
}

func Login(c *fiber.Ctx) error {
	var data map[string]string

	if err := c.BodyParser(&data); err != nil {
		return err
	}

	var user models.Employee

	request := "SELECT * FROM employee WHERE email_employee = '" + data["email_employee"] + "'"
	user, er := database.SelectEmployee(request)
	if er != nil {
		c.Status(fiber.StatusNotFound)
		return c.JSON(fiber.Map{
			"message": er,
		})
	}

	if user.Id_employee == "" {
		c.Status(fiber.StatusNotFound)
		return c.JSON(fiber.Map{
			"message": "user not found",
		})
	}

	if user.Password_employee != utils.GennerateSHA3(data["password_employee"]) {
		c.Status(fiber.StatusBadRequest)
		return c.JSON(fiber.Map{
			"message": "incorrect password",
		})
	}

	claims := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.StandardClaims{
		Issuer:    user.Id_employee,
		ExpiresAt: time.Now().Add(time.Hour * 24).Unix(), //1 day
	})

	token, err := claims.SignedString([]byte(SecretKey))

	if err != nil {
		c.Status(fiber.StatusInternalServerError)
		return c.JSON(fiber.Map{
			"message": "could not login",
		})
	}

	cookie := fiber.Cookie{
		Name:     "jwt",
		Value:    token,
		Expires:  time.Now().Add(time.Hour * 24),
		HTTPOnly: true,
	}

	c.Cookie(&cookie)

	return c.JSON(user)
}

func User(c *fiber.Ctx) error {
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

	var user models.Employee

	request := "SELECT * FROM employee WHERE id_employee = '" + claims.Issuer + "';"
	user, er := database.SelectEmployee(request)

	if er != nil {
		c.Status(fiber.StatusBadRequest)
		return c.JSON(fiber.Map{
			"message": er,
		})
	}
	return c.JSON(user)
}

func Logout(c *fiber.Ctx) error {
	cookie := fiber.Cookie{
		Name:     "jwt",
		Value:    "",
		Expires:  time.Now().Add(-time.Hour),
		HTTPOnly: true,
	}

	c.Cookie(&cookie)

	return c.JSON(fiber.Map{
		"message": "success",
	})
}
