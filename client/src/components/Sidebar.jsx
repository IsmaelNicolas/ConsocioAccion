import React from "react";
import { MdHome, MdPeopleAlt, MdInfo,MdExitToApp } from "react-icons/md";
import MenuItem from "./MenuItem";
import MenuItemCollapse from "./MenuItemCollapse";

const Sidebar = ({ isOpen, setIsOpen }) => {
  return (
    <aside
      className={`bg-primary h-screen w-64 absolute top-15 z-20 left-0 ${
        isOpen ? "Open" : "hidden"
      } shadow-md`}
    >
      <nav className="flex flex-col h-screen shadow-lg align-middle">
        <MenuItem text = {"Principal"} icon= {<MdHome/>} path={"/home"}/>
        <MenuItemCollapse text = {"Clientes"} icon= {<MdPeopleAlt/>} path1={"/clients/register"} path2={"/clients/search"}/>
        <MenuItem text = {"Sobre Nosotros"} icon= {<MdInfo/>} path={"/about"}/>
        <MenuItem text = {"Cerrar Session"} icon= {<MdExitToApp/>} path={"/logout"}/>
      </nav>
    </aside>
  );
};

export default Sidebar;
