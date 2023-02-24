import React, { useEffect, Component } from "react";
import { useState } from "react";
import { useNavigate, useLoaderData } from "react-router-dom";
import RegisterItem from "../components/RegisterItem";
import { MdVisibility, MdModeEdit, MdDelete } from "react-icons/md";
import RegisterEmployee from "../components/AdminRegister";

const Admin = () => {
  const [user, setUser] = useState({ emp_id_emp: "" });
  const [noti, setNoti] = useState(false);

  const handleChange = (event) => {
    const { name, value } = event.target;
    setUser({ ...user, [name]: value });
  };

  const handleSubmit = async (event) => {
    event.preventDefault();
    if (user.emp_id_emp == "") {
      setNoti(true);
      return;
    }
    const status = await fetch(
      "http://toorblue.com:8080/api/register",
      {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        credentials: "include",
        body: JSON.stringify(user),
      }
    ).catch((error) => {
        console.log(error)
        return error;
      });

    console.log(status)

  };

  const navigate = useNavigate();

  const { status, employees } = useLoaderData();

  const emps = [];

  // Loop through each employee to group them by their manager
  if (employees!=null) {
    
    employees.forEach((employee) => {
      const { id_employee, name_employee, lastname_employee } = employee;
      emps.push(name_employee + " " + lastname_employee);
    });
  }

  return (
    <section className="bg-gray-100 py-12 h-screen">
      <button
        onClick={(e) => {
          navigate("/login");
        }}
        className="bg-primary text-white py-2 px-4 rounded-lg hover:bg-secondary absolute top-0 right-0 m-4"
      >
        Cerrar sesión
      </button>

      <RegisterEmployee
        handleSubmit={handleSubmit}
        handleChange={handleChange}
        employees={employees}
        noti={noti}
      />
    </section>
  );
};

export default Admin;

export const loaderAdmin = async () => {
  const data = await fetch("http://toorblue.com:8080/api/admin/employees", {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
    },
    credentials: "include",
  });
  const employees = await data.json();
  const status = data.status;

  return { status, employees };
};
