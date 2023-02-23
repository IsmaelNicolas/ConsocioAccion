const TableEmployees = ({employees})=>{

    return(
        <div className="mt-5 flex justify-center">
        <div className="card bg-white w-2/3">
            <h2 className="mb-5 text-2xl font-medium text-center">Tabla de empleados</h2>
          <table className="table table-compact w-full">
            <thead>
              <tr>
                <th></th>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Acciones</th>
              </tr>
            </thead>
            <tbody>
              {employees.map((employee, index) => (
                <tr>
                  <th>{index + 1}</th>
                  <td>{employee.name_employee}</td>
                  <td>{employee.lastname_employee}</td>
                  <td className="flex justify-between text-2xl">
                    <MdModeEdit className="text-green-700" />
                    <MdDelete className="text-red-700" />
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    );    

}   
export default TableEmployees