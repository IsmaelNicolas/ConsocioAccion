import { useEffect, useState } from "react";
import { useLocation } from "react-router-dom";
import RegisterItem from "../components/RegisterItem";
import RegisterItemSelect from "../components/RegisterItemRadio";

const RegisterDocument = () => {
  const location = useLocation();
  const [date, setDate] = useState("");

  useEffect(() => {
    const today = new Date();
    const twoMonthsFromToday = new Date(today.setMonth(today.getMonth() + 3));
    setDate(twoMonthsFromToday.toISOString().split("T")[0]);
  }, []);

  const [formData, setFormData] = useState({
    id_client: location.state.id,
    property_direction: "",
    date_reunion: date,
    spouse_entity: "",
    client_ocupation: "",
    entity_direction: "",
    spouse_ocupation: "",
    client_position: "",
    spouse_salary: 0,
    client_salary: 0,
    spouse_lastname: "",
    spouse_direction: "",
    payment: 0
  });

  const handleChange = (event) => {
    const { name, value } = event.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = async (evt) => {
    evt.preventDefault();

    console.log(formData);
    const status = await fetch(
      "https://toorblue.com/api/clients/insert/economiccard",
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
        body: JSON.stringify(formData),
      }
    )
      .then((response) => {
        if (response.ok) return response.status;
        console.log(formData);
        throw new Error("Error: " + response.status);
      })
      .catch((error) => {
        return error;
      });
  };

  return (
    <form onSubmit={handleSubmit}>
      <div className=" bg-base-200 flex justify-center mb-10">
        <div className="pt-20 w-5/6 bg-base-200 h-auto">
          <div className="card w-full bg-base-100 shadow-xl">
            <div className="card-body flex justify-center">
              <h2 className="card-title">Registro de Etapa</h2>

              <div className="flex">
                <RegisterItemSelect
                  name={"type_property"}
                  text={"Tipo de propiedad"}
                  onChange={handleChange}
                  options={["Terreno", "Departamento", "Casa", "Otro"]}
                />
                <RegisterItem
                  name={"property_direction"}
                  text={"Sector de la propiedad"}
                  type={"text"}
                  onChange={handleChange}
                />
              </div>

              <div className="flex">
                <RegisterItem
                  name={"payment"}
                  text={"Valor del abono"}
                  type={"number"}
                  onChange={handleChange}
                />
                <RegisterItem
                  name={"date_reunion"}
                  text={"Fecha siguiente reunion"}
                  type={"date"}
                  defaultValue={date}
                  onChange={handleChange}
                />
              </div>

              <div>
                <h2 className="card-title mt-2 mb-2">
                  Registro Informe Economico
                </h2>

                <RegisterItem
                  name={"client_entity"}
                  text={"Nombre de la entidad"}
                  type={"text"}
                  onChange={handleChange}
                />

                <RegisterItem
                  name={"client_position"}
                  text={"Cargo"}
                  type={"text"}
                  onChange={handleChange}
                />
                <RegisterItem
                  name={"entity_direction"}
                  text={"Dirección"}
                  type={"text"}
                  onChange={handleChange}
                />

                <div className="mt-2 flex justify-between">
                  <RegisterItemSelect
                    name={"client_ocupation"}
                    text={"Ocupacion"}
                    onChange={handleChange}
                    options={[
                      "Empleado publico",
                      "Empleado privado",
                      "Independiente",
                      "Otro",
                    ]}
                  />

                  <RegisterItem
                    name={"client_salary"}
                    text={"Ingreso Mensual"}
                    type={"number"}
                    onChange={handleChange}
                  />
                </div>
              </div>

              <div>
                <h2 className="card-title mt-2 mb-2">
                  Registro Conyugue u Otro
                </h2>

                <RegisterItem
                  name={"spouse_lastname"}
                  text={"Apellido"}
                  type={"text"}
                  onChange={handleChange}
                />

                <RegisterItem
                  name={"spouse_entity"}
                  text={"Nombre de la entidad"}
                  type={"text"}
                  onChange={handleChange}
                />

                <RegisterItem
                  name={"spouse_direction"}
                  text={"Dirección"}
                  type={"text"}
                  onChange={handleChange}
                />

                <div className="mt-2 flex justify-between">
                  <RegisterItemSelect
                    name={"spouse_ocupation"}
                    text={"Ocupacion"}
                    onChange={handleChange}
                    options={[
                      "Empleado publico",
                      "Empleado privado",
                      "Independiente",
                      "Otro",
                    ]}
                  />

                  <RegisterItem
                    name={"spouse_salary"}
                    text={"Ingreso Mensual"}
                    type={"number"}
                    onChange={handleChange}
                  />
                </div>
              </div>

              <div className="card-actions justify-center mt-5">
                <input
                  type="submit"
                  value="Registrar"
                  className="btn btn-primary text-base-100"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    </form>
  );
};

export default RegisterDocument;
