package models

type Employee struct {
	Id_employee       string `json:"id_employee"`
	Name_employee     string `json:"name_employee"`
	Lastname_employee string `json:"lastname_employee"`
	Email_employee    string `json:"email_employee" `
	Password_employee string `json:"password_employee"`
	Position_employee string `json:"position_employee"`
	Permissions       string `json:"permissions"`
}

func (Employee) TableName() string {
	return "employee"
}
