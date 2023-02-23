package models

type Document struct {
	Id_document    string
	Id_client      string
	Name_client    string
	Type_document  string
	Check_document string
}

func (Document) TableName() string {
	return "Document"
}
