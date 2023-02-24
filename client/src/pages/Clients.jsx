import React from "react";
import { useLoaderData } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import { MdVisibility, MdModeEdit, MdDelete } from "react-icons/md";

const Clients = () => {
  const navigate = useNavigate();

  const { clients, status } = useLoaderData();

  console.log(clients);

  const navigateToRegister = () => {
    navigate("/clients/register");
  };
  return (
    <div className="h-screen bg-base-200 flex justify-center">
      <div className="pt-20 w-5/6">
        <div className="card w-full bg-base-100 shadow-xl">
          <div className="card-body ">
            <h2 className="card-title flex justify-between">
              Clientes
              <button
                className="btn btn-info w-6/6  sm:w-1/6 text-xs sm:text-xs"
                onClick={navigateToRegister}
              >
                Registrar nuevo
              </button>
            </h2>
            <div className="overflow-x-auto">
              <table className="table table-compact w-full">
                <thead>
                  <tr>
                    <th></th>
                    <th>Cedula</th>
                    <th>Nombre</th>
                    <th>Telefono</th>
                    <th>Fecha de registro</th>
                    <th>Acciones</th>
                  </tr>
                </thead>
                <tbody>
                  {clients.map((client, index) => (
                    <tr>
                      <th>{index + 1}</th>
                      <td>{client.Id_client}</td>
                      <td>
                        {client.Name_client + " " + client.Lastname_client}
                      </td>
                      <td>{client.Phone_client}</td>
                      <td>{client.Date_suscribe}</td>
                      <td className="flex justify-between text-2xl">
                        <MdVisibility
                          className="text-blue-700"
                          onClick={() => console.log(client.Id_client)}
                        />
                        <MdModeEdit className="text-green-700" />
                        <MdDelete className="text-red-700" />
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
              <div />
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Clients;

export const loaderClients = async () => {
  const data = await fetch("http://toorblue.com:8080/api/clients", {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
    },
    credentials: "include",
  });

  const clients = await data.json();
  const status = await data.status;
  return { clients, status };
};
