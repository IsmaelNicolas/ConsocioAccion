import React from "react";
import { useState } from "react";

const Admin = () => {
  const [user, setUser] = useState({
    name: "",
    email: "",
    password: "",
  });

  const handleChange = (event) => {
    const { name, value } = event.target;
    setUser({ ...user, [name]: value });
  };

  const handleSubmit = (event) => {
    event.preventDefault();
    console.log(user);
    // Enviar datos del formulario al servidor
  };

  return (
    <section className="bg-gray-100 py-12 h-screen">
      <div className="container mx-auto px-4">
        <h1 className="text-2xl font-medium mb-6 text-center">
          Registro de usuario
        </h1>
        <form onSubmit={handleSubmit}>
          <div className="mb-4">
            <label className="block text-gray-700 font-medium mb-2">
              Nombre
            </label>
            <input
              name="name"
              value={user.name}
              onChange={handleChange}
              className="w-full p-2 rounded-lg border border-gray-400"
            />
          </div>
          <div className="mb-4">
            <label className="block text-gray-700 font-medium mb-2">
              Email
            </label>
            <input
              type="email"
              name="email"
              value={user.email}
              onChange={handleChange}
              className="w-full p-2 rounded-lg border border-gray-400"
            />
          </div>
          <div className="mb-4">
            <label className="block text-gray-700 font-medium mb-2">
              Contraseña
            </label>
            <input
              type="password"
              name="password"
              value={user.password}
              onChange={handleChange}
              className="w-full p-2 rounded-lg border border-gray-400"
            />
          </div>
          <button
            type="submit"
            className="bg-primary text-white py-2 px-4 rounded-lg hover:bg-primary-dark"
          >
            Registrarse
          </button>
        </form>
      </div>
    </section>
  );
};

export default Admin;
