package models

type Client struct {
	id_client             string
	id_employee           string
	name_client           string
	lastname_client       string
	phone_client          string
	type_client           string
	email_client          string
	date_suscribe         string
	city_subscribe        string
	spouse_name           string
	spouse_ocupation      string
	spouse_direction      string
	spouse_salary         string
	spouse_entity         string
	direction_client      string
	ocupation_client      string
	salary_client         string
	marital_status_client string
}

func (Client) TableName() string {
	return "client"
}
