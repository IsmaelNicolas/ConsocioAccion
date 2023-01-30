package controllers

import (
	"ConsocioAccion/models"
	"fmt"

	"github.com/gofiber/fiber/v2"
	"github.com/golang-jwt/jwt/v4"
)

func getClients(c *fiber.Ctx) error {

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

	fmt.Println(claims, clients)

	//request := "SELECT ID_CLIENT,  NAME_CLIENT, LASTNAME_CLIENT, PHONE_CLIENT,  EMAIL_CLIENT FROM clients WHERE id_employee = '" + claims.Issuer + "';"
	/*clients, er := database.SelectEmployee(request)

	if er != nil {
		c.Status(fiber.StatusBadRequest)
		return c.JSON(fiber.Map{
			"message": er,
		})
	}
	*/
	return c.JSON(fiber.Map{"message": "clients"})
}
