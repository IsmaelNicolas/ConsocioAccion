import RegisterItem from "../components/RegisterItem";


const RegisterEmployee = ({handleChange,handleSubmit,employees,noti}) => {

    return(
        <div className="card  mt-9  w-2/3 bg-white mx-auto px-4">
        <h1 className="text-2xl font-medium mt-6 mb-3 text-center">
          Registro de usuario
        </h1>
        <form onSubmit={handleSubmit}>
          <div className="flex justify-between">
            <RegisterItem
              text={"Nombre"}
              type={"text"}
              name={"name_employee"}
              onChange={handleChange}
            />

            <RegisterItem
              text={"Apellido"}
              type={"text"}
              name={"lastname_employee"}
              onChange={handleChange}
            />
          </div>
          <div className="flex justify-between">
            <div className="form-control w-full max-w-xs mr-4">
              <label className="label">
                <span className="label-text">{"Superior"}</span>
              </label>
              <div className="indicator w-full">
              {noti? (<span className="indicator-item badge badge-secondary"></span>):(<></>)}
              
              <select
                className="select select-bordered bg-orange-50 w-full"
                name={"emp_id_emp"}
                onChange={handleChange}
                required
              >
                <option disabled selected>
                  {"Superior"}
                </option>
                { employees?  (employees.map((employee) => {
                  const { id_employee, name_employee, lastname_employee } =
                    employee;
                  return (
                    <option key={id_employee} value={id_employee}>
                      {name_employee + " " + lastname_employee}
                    </option>
                  );
                })):(<></>)}
              </select>
              </div>
            </div>
            
            <RegisterItem
              text={"Email"}
              type={"email"}
              name={"email_employee"}
              onChange={handleChange}
            />

            <RegisterItem
              text={"Contraseña"}
              type={"password"}
              name={"password_employee"}
              onChange={handleChange}
            />
          </div>
          <div className="flex justify-center mt-5 card-actions mb-5">
            <button
              type="submit"
              className="bg-primary text-white py-2 px-4 rounded-lg hover:bg-secondary m-2 "
            >
              Registrar Empleado
            </button>
          </div>
        </form>
      </div>
    );
}

export default RegisterEmployee