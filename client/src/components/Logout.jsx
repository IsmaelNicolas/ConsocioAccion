import React from "react";
import { useLoaderData } from "react-router-dom";
import { useNavigate } from "react-router-dom";

const Logout = () => {
  const navigate = useNavigate();

  const navigateToLogin = () => {
    navigate("/login");
  };

  const { logi } = useLoaderData();
 

  return (
    <div className="hero min-h-screen bg-base-200">
      <div className="hero-content text-center">
        <div className="max-w-md">
          <h1 className="text-5xl font-bold">Gracias por usar el sistema</h1>
          <p className="py-6">
          ¡Gracias por utilizar nuestro sistema! Estamos contentos de poder ayudarte. Si necesitas algo más, no dudes en preguntar.
          </p>
          <button className="btn btn-primary text-base-100" onClick={navigateToLogin}>Aceptar</button>
        </div>
      </div>
    </div>
  );
};

export default Logout;

export const loaderLogout = async () => {
  const logi = await fetch("http://toorblue.com:8080/api/logout", {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
    },
    credentials:'include'
  });
  return { logi };
};
