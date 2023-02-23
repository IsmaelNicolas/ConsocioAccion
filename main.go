package main

import (
	"ConsocioAccion/database"
	"ConsocioAccion/routes"
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

	app.Static("/", "./build")

	routes.Setup(app)

	port := os.Getenv("PORT")

	if port == "" {
		port = "8080"

	}
	app.Listen(":" + port)
	/*
		go func() {
			if err := app.Listen(":" + port); err != nil {
				log.Fatalf("Error al iniciar la aplicación: %v", err)
			}
		}()

		log.Printf("Listening on port %s\n\n", port)

		// Mantenemos el programa principal en ejecución
		// mientras la goroutine del servidor está en funcionamiento.
		<-make(chan struct{})
	*/
}
