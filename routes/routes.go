package routes

import (
	"ConsocioAccion/controllers"

	"github.com/gofiber/fiber/v2"
)

func Setup(app *fiber.App) {

	app.Post("/api/register", controllers.Register)
	app.Post("/api/login", controllers.Login)
	app.Get("/api/user", controllers.User)
	app.Get("/api/logout", controllers.Logout)
	app.Get("/api/clients", controllers.GetClients)
	app.Post("/api/clients/insert", controllers.InsertClient)
	app.Post("/api/clients/insert/economiccard", controllers.InsertDataCLient)
	app.Get("/api/client/:id", controllers.GetClient)
	app.Get("/api/spouse/:id", controllers.GetSpouseClient)
	app.Get("/api/stage/:id", controllers.GetStageClient)
	app.Get("/api/economic/:id", controllers.GetEconomicClient)
	app.Get("/api/admin/employees", controllers.GetEmployees)

}
