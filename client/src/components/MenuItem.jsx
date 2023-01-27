import React from "react";
import { NavLink } from "react-router-dom";

const MenuItem = (props) => {
  let activeClassName =
    "text-neutral bg-base-200  font-medium block py-5 px-3 flex items-center";
  let notActive =
    "text-white font-medium block py-5 px-3 hover:bg-neutral flex items-center";
  return (
    <NavLink
      to={props.path}
      className={({ isActive }) => (isActive ? activeClassName : notActive)}
    >
      <div className=" text-3xl sm:text-3xl">{props.icon}</div>
      <span className="ml-2">{props.text}</span>
    </NavLink>
  );
};

export default MenuItem;
