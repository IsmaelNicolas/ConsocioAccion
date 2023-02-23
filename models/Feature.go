package models

type Feature struct {
	Id_feature   string
	Name_feature string
}

func (Feature) TableName() string {
	return "Feature"
}
