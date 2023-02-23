package main

import (
	"ConsocioAccion/database"
	"ConsocioAccion/routes"
	"log"
	"os"

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

	port := os.Getenv("PORT")

	if port == "" {
		port = "8080"

	}
	log.Printf("Listening on port %s\n\n", port)
	app.Listen(port)

}
