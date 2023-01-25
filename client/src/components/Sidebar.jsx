import React from "react";
import { MdHome, MdPeopleAlt, MdInfo,MdExitToApp } from "react-icons/md";

const Sidebar = ({ isOpen, setIsOpen }) => {
  return (
    <aside
      className={`bg-primary h-screen w-64 absolute top-15 z-20 left-0 ${
        isOpen ? "Open" : "hidden"
      } shadow-md`}
    >
      <nav className="flex flex-col h-full shadow-lg">
        <a
          href="#"
          className="text-white font-medium block py-2 px-3 hover:bg-gray-700 flex items-center"
        >
          <MdHome className="text-white text-2xl" />
          <span className="ml-2">Principal</span>
        </a>
        <a
          href="#"
          className="text-white font-medium block py-2 px-3 hover:bg-gray-700 flex items-center"
        >
          <MdPeopleAlt className="text-white text-2xl" />
          <span className="ml-2">Clientes</span>
        </a>
        <a
          href="#"
          className="text-white font-medium block py-2 px-3 hover:bg-gray-700 flex items-center"
        >
          <MdInfo className="text-white text-2xl" />
          <span className="ml-2">Sobre nosotros</span>
        </a>
        <a
          href="#"
          className="text-white font-medium block py-2 px-3 hover:bg-gray-700 flex items-center"
        >
          <MdExitToApp className="text-white text-2xl" />
          <span className="ml-2">Cerrar Session</span>
        </a>
      </nav>
    </aside>
  );
};

export default Sidebar;
