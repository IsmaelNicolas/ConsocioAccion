import React from "react";
import Logo from "../components/Logo";
import { useState } from "react";
import { useNavigate } from "react-router-dom";

const Login = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [redirect, setRedirect] = useState(false);
  const navigate = useNavigate();
  
  const handleSubmit = (event) => {
    event.preventDefault();
    // Enviar datos del formulario al servidor o realizar otra acción
    console.log(email, password);
    setRedirect(true);

    if (redirect) {
        navigate("/home")
    }

  };

  return (
    <div className="hero min-h-screen bg-base-200">
      <div className="hero-content flex-col lg:flex-row-reverse">
        <div className="text-center lg:text-left">
          <Logo />
        </div>
        <form
          className="card flex-shrink-0 w-full max-w-sm shadow-2xl bg-base-100"
          onSubmit={handleSubmit}
        >
          <div className="card-body">
            <div className="form-control">
              <label className="label">
                <span className="label-text">Email</span>
              </label>
              <input
                type="text"
                placeholder="Email"
                className="input input-bordered"
                onChange={(e) => setEmail(e.target.value)}
              />
            </div>
            <div className="form-control">
              <label className="label">
                <span className="label-text">Contraseña</span>
              </label>
              <input
                type="password"
                placeholder="Contraseña"
                className="input input-bordered"
                onChange={(e) => setPassword(e.target.value)}
              />
              <label className="label">
                <a href="#" className="label-text-alt link link-hover">
                  Olvidaste tu contraseña?
                </a>
              </label>
            </div>
            <div className="form-control mt-6">
              <button className="btn btn-primary text-base-100" type="submit">
                Ingresar
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
  );
};

export default Login;
