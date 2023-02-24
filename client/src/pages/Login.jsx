import React from "react";
import Logo from "../components/Logo";
import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import Alert from "../components/Alert";

const Login = () => {
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const [redirect, setRedirect] = useState(false);
  const [showModal, setShowModal] = useState(false);
  const navigate = useNavigate();

  const navigateToHome = () => {
    setRedirect(true);
    navigate("/home");
  };

  useEffect(() => {
    if (redirect) {
      navigateToHome();
    }
  }, [redirect]);

  const handleSubmit = async (event) => {
    event.preventDefault();
    // Enviar datos del formulario al servidor o realizar otra acción
    //console.log(email, password);
    const response = await fetch("http://toorblue.com:8080/api/login", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      credentials: "include",
      body: JSON.stringify({
        email_employee: email,
        password_employee: password,
      }),
    }).catch((error) => {
      console.log("no valeee", error);
      setShowModal(true);
    });

    const status = await response.status;
    const data = await response.json();
    console.log({ perm: data.permissions, status: status });
    if (status == 200 && data.permissions == "admin") {
      navigate("/admin");
    } 
    if (status == 200 &&data.permissions == "emp"){
      navigate("/home");
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
                <span className="label-text text-primary">Email</span>
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
      <Alert
        show={showModal}
        handleClose={() => setShowModal(false)}
        title={"Error"}
        message={"Datos incorrectos"}
      />
    </div>
  );
};

export default Login;
