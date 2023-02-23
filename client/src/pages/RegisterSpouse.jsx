import RegisterItem from "../components/RegisterItem";
import RegisterItemSelect from "../components/RegisterItemRadio";

const RegisterSpouse = () => {
  return (
    <form>
      <div className="h-screen bg-base-200 flex justify-center">
        <div className="pt-20 w-5/6">
          <div className="card w-full bg-base-100 shadow-xl">
            <div className="card-body flex justify-center">
              <h2 className="card-title">Registro Conyugue u Otro</h2>
              <RegisterItem
                name={"spouse_lastname"}
                text={"Apellido"}
                type={"text"}
              />

              <RegisterItem
                name={"spouse_entity"}
                text={"Nombre de la entidad"}
                type={"text"}
              />

              <RegisterItem
                name={"spouse_direction"}
                text={"Dirección"}
                type={"text"}
              />
              <div className="mt-2 flex justify-between">
                <RegisterItemSelect
                  name={"spouse_ocupation"}
                  text={"Ocupacion"}
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
                />
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

export default RegisterSpouse;
