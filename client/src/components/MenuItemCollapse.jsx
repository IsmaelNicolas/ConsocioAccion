import React from "react";
import { NavLink } from "react-router-dom";
import { MdAppRegistration,MdManageSearch } from "react-icons/md";

const MenuItemCollapse = (props) => {
  let activeClassName = "block text-base-100 py-5 px-3 flex items-center";
  let notActive = "block  text-base-100 py-5 px-3  flex items-center";
  return (
    <div className="collapse">
      <input type="checkbox" className="peer" />
      <div className="flex items-center collapse-title bg-primary text-base-100 peer-checked:bg-secondary">
        <div className=" text-3xl sm:text-3xl">{props.icon}</div>
        <span className="ml-2">{props.text}</span>
      </div>
      <div className="collapse-content bg-primary text-primary-content peer-checked:bg-secondary">
        <NavLink
          to={props.path1}
          className={({ isActive }) => (isActive ? activeClassName : notActive)}
        >
          <MdAppRegistration />
          <span className="ml-2">Registro</span>
        </NavLink>
        <NavLink
          to={props.path2}
          className={({ isActive }) => (isActive ? activeClassName : notActive)}
        >
          <MdManageSearch/>
          <span className="ml-2">Buscar</span>
        </NavLink>
      </div>
    </div>
  );
};

export default MenuItemCollapse;
