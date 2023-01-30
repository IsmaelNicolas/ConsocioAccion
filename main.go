package main

import (
	"ConsocioAccion/database"
	"ConsocioAccion/routes"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
)

func main() {

	database.Connect()

	app := fiber.New()

	app.Use(cors.New(cors.Config{
		AllowCredentials: true,
	}))

	app.Static("/", "./client/dist")

	routes.Setup(app)

	app.Listen("0.0.0.0:8080")

}