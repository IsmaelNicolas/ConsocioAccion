import React, { useState } from "react";
import { useLoaderData } from "react-router-dom";
import { useNavigate } from "react-router-dom";

const Client = () => {
  const [nui, setNui] = useState();
  const navigate = useNavigate();

  const { client, spouse, stage, economic } = useLoaderData();

  const handleChange = (event) => {
    setNui(event.target.value);
  };

  const handleSubmit = () => {
    navigate("/clients/" + nui);
  };

  const t = {
    Nombre: client[0].Name_client + " " + client[0].Lastname_client,
    Cédula: client[0].Id_client,
    "Fecha de inscripción": client[0].Date_suscribe,
    Correo: client[0].Email_client,
    Número: client[0].Phone_client,
    "Estado Civil": client[0].Marital_status_client,
  };

  let conyuge;

  if (spouse != null) {
    conyuge = {
      Nombre: spouse.Spouse_name,
      Ocupacion: spouse.Spouse_ocupation,
      "Nombre de la entidad": spouse.Spouse_entity,
      Dirección: spouse.Spouse_direction,
      "Ingreso Mensual": spouse.Spouse_salary,
    };
  }

  let stages;

  if (stage != null) {
    stages = stage;
    console.log(stages);
  }

  let infEconomic;
  if (economic != null) {
    console.log(economic);
    infEconomic = {
      "Nombre Entidad": economic[0].Entity_name,
      "Direccion Entidad": economic[0].Direction_entity,
      "Ocupacion Cliente": economic[0].Ocupation_client,
      "Ingerso mensual": economic[0].Salary_client,
    };
  }

  function RenderAttributes(props) {
    const { p } = props;
    const result = [];

    for (const key in p) {
      result.push(
        <div key={key}>
          <span className="text-xl font-medium">{key}</span>
          <p className="text-base">{p[key]}</p>
        </div>
      );
    }

    return result;
  }

  return (
    <div className="h-auto bg-gray-200 flex justify-center ">
      <div className=" pt-20 w-5/6 flex-col mb-10">
        <div className="flex justify-between">
          <div className="card w-1/3 mt-5 mr-2 bg-base-100 shadow-xl ">
            <div className="card-body">
              <h2 className="card-title text-2xl text-primary">
                Datos peronales
              </h2>
              <div className="flex justify-center">
                {client != null ? (
                  <div className="w-3/4">{RenderAttributes({ p: t })}</div>
                ) : (
                  <div>nope</div>
                )}
              </div>
            </div>
          </div>

          <div className="card w-1/3 mt-5 mr-2 bg-base-100 shadow-xl ">
            <div className="card-body flex justify-center flex-col">
              <h2 className="card-title text-2xl text-primary">
                Datos Conyuge
              </h2>
              {spouse != null ? (
                <div>{RenderAttributes({ p: conyuge })}</div>
              ) : (
                <button
                  className="btn w-1/2  m-20"
                  onClick={() => {
                    navigate("/clients/register/spouse");
                  }}
                >
                  Continuar con la etapa
                </button>
              )}
            </div>
          </div>

          <div className="card w-1/3 mt-5 mr-2 bg-base-100 shadow-xl ">
            <div className="card-body flex justify-center flex-col">
              <h2 className="card-title text-2xl text-primary">
                Informe Economico
              </h2>
              {economic != null ? (
                <div>{RenderAttributes({ p: infEconomic })}</div>
              ) : (
                <button
                  className="btn w-1/2  m-20"
                  onClick={() => {
                    navigate("/clients/register/spouse");
                  }}
                >
                  Continuar con la etapa
                </button>
              )}
            </div>
          </div>
        </div>
        {stage != null ? (
          <div className="flex ">
            <div className="card w-full mt-5 mr-2 bg-base-100 shadow-xl ">
              <div className="card-body flex justify-center flex-col">
                <h2 className="card-title text-2xl text-primary">Etapas</h2>
                {console.log(stage)}
                {stage != null ? (
                  <table className="table table-compact w-full">
                    <thead>
                      <tr>
                        <th></th>
                        <th>Etapa</th>
                        <th>Inicio</th>
                        <th>Fin</th>
                        <th>Check</th>
                      </tr>
                    </thead>
                    <tbody>
                      {stages.map((st, index) => (
                        <tr>
                          <th>{index + 1}</th>
                          <td>{st.Name_stage}</td>
                          <td>{st.Stage_start_date}</td>
                          <td>{st.Stage_end_date}</td>
                          <td>
                            <div className="form-control">
                              <label className="cursor-pointer label">
                                <span className="label-text">
                                  Etapa aprobada
                                </span>
                                <input
                                  type="checkbox"
                                  className="checkbox checkbox-success"
                                />
                              </label>
                            </div>
                          </td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                ) : (
                  <div></div>
                )}
              </div>
            </div>
          </div>
        ) : (
          <div className="flex justify-center">
            <button
              onClick={(evt) => {
                navigate("/clients/stage1", {
                  state: { id: client[0].Id_client },
                });
              }}
              className="btn btn-primary mt-10 text-4xl text-base-100"
            >
              REGISTRAR
            </button>
          </div>
        )}
      </div>
    </div>
  );
};

export default Client;

export const loaderClient = async ({ params }) => {
  const requests = [
    fetch("https://toorblue.com/api/client/" + params.idClient, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "include",
    }),
    fetch("https://toorblue.com/api/spouse/" + params.idClient, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "include",
    }),
    fetch("https://toorblue.com/api/stage/" + params.idClient, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "include",
    }),
    fetch("https://toorblue.com/api/economic/" + params.idClient, {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "include",
    }),
  ];

  const [clientResponse, spouseResponse, stageResponse, economicResponse] =
    await Promise.all(requests).catch((error) => console.log(error));

  const client = await clientResponse.json();
  const spouse = await spouseResponse.json();
  const stage = await stageResponse.json();
  const economic = await economicResponse.json();
  return { client, spouse, stage, economic };
};
