import React, { useState } from "react";
import Logo from "../components/Logo";
import { useLoaderData } from "react-router-dom";
import { useNavigate } from "react-router-dom";
import { useEffect } from "react";

const  Home = () => {

  const navigate = useNavigate();

  const { data,user } = useLoaderData();

  console.log(user.name_employee)

  useEffect(()=>{
    if (data.status !=200) {
      navigate("/login");
    }
  },[])

  return (
    <div className="flex justify-center flex-col items-center align-middle h-screen bg-base-200">
      <span>Bienvenido {user.name_employee} {user.lastname_employee}</span>
        <Logo/>
    </div>
  );
};

export default Home;


export const loaderHome = async () => {
  const data = await fetch("http://localhost:8080/api/user", {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
    },
    credentials:'include'
  });
  const user = await data.json()
  return { "data":data,"user":user };
};