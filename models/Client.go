package models

type Client struct {
	Id_client             string
	Name_client           string
	Lastname_client       string
	Phone_client          string
	Type_client           string
	Email_client          string
	Date_suscribe         string
	City_suscribe         string
	Spouse_name           string
	Spouse_ocupation      string
	Spouse_direction      string
	Spouse_salary         float32
	Spouse_entity         string
	Direction_client      string
	Ocupation_client      string
	Salary_client         float32
	Marital_status_client string
	Entity_client         string
	Direction_entity      string
	Entity_name           string
}

func (Client) TableName() string {
	return "client"
}
