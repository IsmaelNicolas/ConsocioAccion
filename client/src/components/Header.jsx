import React, { useState } from 'react';
import Sidebar from './Sidebar';
import { MdMenu, MdMenuOpen } from "react-icons/md";
import Logo from './Logo';
import { Link } from 'react-router-dom';


const Navbar = () => {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <header className='fixed top-0 w-full z-50'>
      <nav className="flex items-center justify-between p-4 bg-primary">
        <button onClick={() => setIsOpen(!isOpen)} className="text-white font-medium">
          {isOpen? <MdMenuOpen className='text-white text-2xl'/>:<MdMenu className='text-white text-2xl'/> }
        </button>
          <h1 className='text-base-100'>Bienvenido</h1>
        <Link to="/" className="text-white font-medium">
          Accion Inmobiliaria
        </Link>
      </nav>
      <Sidebar isOpen={isOpen} setIsOpen={setIsOpen} />
    </header>
  );
}

export default Navbar;
