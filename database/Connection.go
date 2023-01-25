package database

import (
	"github.com/IsmaelNicolas/ConsocioAccion/models"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var DB *gorm.DB

func Connect() {
	conn, err := gorm.Open(mysql.Open("root:toor@/consorcio"), &gorm.Config{})

	if err != nil {
		panic("Could not connnet to database")
	}

	DB = conn

	conn.AutoMigrate(&models.User{})
}
