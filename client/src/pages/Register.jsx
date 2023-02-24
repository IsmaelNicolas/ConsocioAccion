import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import RegisterItem from "../components/RegisterItem";
import RegisterItemSelect from "../components/RegisterItemRadio";

const Register = () => {
  const [formData, setFormData] = useState({
    id_client: "",
    name_client: "",
    lastName_client: "",
    email_client: "",
    phone_client: "",
    city_client: "",
    direction_client: "",
    status_client: "",
  });

  const [checkboxes, setCheckboxes] = useState([false]);
  const [isButtonEnabled, setIsButtonEnabled] = useState(false);

  const navigate = useNavigate();

  const handleCheckboxChange = (index) => {
    const updatedCheckboxes = [...checkboxes];
    updatedCheckboxes[index] = !updatedCheckboxes[index];
    setCheckboxes(updatedCheckboxes);

    if (updatedCheckboxes.every((checkbox) => checkbox === true)) {
      setIsButtonEnabled(true);
    } else {
      setIsButtonEnabled(false);
    }
  };

  const handleChange = (event) => {
    const { name, value } = event.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = async (evt) => {
    evt.preventDefault();
    console.log(formData);

    const status = await fetch("https://toorblue.com/api/clients/insert", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "include",
      body: JSON.stringify(formData),
    })
      .then((response) => {
        if (response.ok) return response.status;
        throw new Error("Error: " + response.status);
      })
      .catch((error) => {
        return error;
      });

    if (isButtonEnabled && status == 200) {
      navigate("/clients/stage1", { state: { id: formData.id_client } });
    }

    

  };

  const [date, setDate] = useState("");

    useEffect(() => {
      const today = new Date();
      const twoMonthsFromToday = new Date(today.setMonth(today.getMonth() + 3));
      setDate(twoMonthsFromToday.toISOString().split("T")[0]);
    }, []);

  return (
    <form onSubmit={handleSubmit}>
      <div className="h-auto bg-base-200 flex justify-center">
        <div className="pt-20 w-5/6 mb-10">
          <div className="card w-full bg-base-100 shadow-xl">
            <div className="card-body flex justify-center">
              <h2 className="card-title">Registro</h2>

              <div className="flex">
                <div className="w-1/2 mr-2">
                  <RegisterItem
                    text={"Cedula"}
                    type={"text"}
                    name={"id_client"}
                    onChange={handleChange}
                  />
                </div>
                <div className="w-1/2 ml-2">
                  <RegisterItem
                    text={"Ciudad"}
                    type={"text"}
                    name={"city_client"}
                    onChange={handleChange}
                  />
                </div>
              </div>

              <div className="flex">
                <div className="w-1/2 mr-2">
                  <RegisterItem
                    text={"Nombres"}
                    type={"text"}
                    name={"name_client"}
                    onChange={handleChange}
                  />
                </div>
                <div className="w-1/2 ml-2">
                  <RegisterItem
                    text={"Apellidos"}
                    type={"text"}
                    name={"lastName_client"}
                    onChange={handleChange}
                  />
                </div>
              </div>

              <div className="mt-2 flex justify-between">
                <RegisterItemSelect
                  text={"Estado Civil"}
                  name={"status_client"}
                  options={["Soltero", "Casado", "Divorciado"]}
                  onChange={handleChange}
                />
                <RegisterItem
                  text={"Email"}
                  type={"email"}
                  name={"email_client"}
                  onChange={handleChange}
                />
              </div>

              <RegisterItem
                text={"Direccion domiciliaria"}
                type={"text"}
                name={"direction_client"}
                onChange={handleChange}
              />
              <RegisterItem text={"Referencia"} type={"text"} />

              <div className="flex">
                <div className="w-1/2 mr-2">
                  <RegisterItem
                    text={"Telefono Fijo"}
                    type={"text"}
                    name={"phone_client"}
                    onChange={handleChange}
                  />
                </div>
                <div className="w-1/2 ml-2">
                  <RegisterItem text={"Telefono Cedular"} type={"text"} />
                </div>
              </div>

              <div className="form-control">
                <label className="cursor-pointer label">
                  <span className="label-text text-primary text-xl">
                    Realiza Abono
                  </span>
                  <input
                    type="checkbox"
                    className="checkbox checkbox-success"
                    checked={checkboxes[0]}
                    onChange={() => handleCheckboxChange(0)}
                  />
                </label>
              </div>

              {!isButtonEnabled? (
                <RegisterItem
                  name={"date_reunion"}
                  text={"Fecha siguiente reunion"}
                  type={"date"}
                  defaultValue={date}
                />
              ) : (
                <div></div>
              )}

              <div className="card-actions justify-center mt-5">
                <input
                  type="submit"
                  value="Registrar"
                  className="btn btn-primary text-base-100"
                />
                <input
                  type="submit"
                  value="Continuar con proceso"
                  className="btn btn-primary text-base-100"
                  disabled={!isButtonEnabled}
                />
              </div>
            </div>
          </div>
        </div>
      </div>
    </form>
  );
};

export default Register;
