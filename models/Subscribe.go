package models

type Subscribe struct {
	Id_employee    string `json:"id_"`
	Id_client      string `json:"name_"`
	Date_subscribe string
	City_suscribe  string
}

func (Subscribe) TableName() string {
	return "Subscribe"
}
