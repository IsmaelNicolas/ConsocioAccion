import React from "react";
import { Link, useRouteError } from "react-router-dom";
import Logo from "../components/Logo";

const NotFound = () => {

  const error = useRouteError();
  console.log(error)

  return (
    <div className="flex justify-center flex-col items-center align-middle h-screen bg-base-200">
        <Logo/>
      <div className="flex align-middle">
      </div>
      <div className="text-3xl text-center sm:text-2xl mb-5">
        Pagina no encontrada
      </div>
      <Link to="/home">
        <button className="btn btn-xs sm:btn-sm md:btn-md lg:btn-lg btn-primary text-base-100 mt-5">
          Volver al inicio
        </button>
      </Link>
    </div>
  );
};

export default NotFound;
