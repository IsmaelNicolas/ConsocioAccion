package models

type Property struct {
	Id_client     string
	Id_property   string
	Type_property string
}

func (Property) TableName() string {
	return "Property"
}
