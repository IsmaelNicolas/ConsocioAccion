import React, { useState } from 'react';
import Sidebar from './Sidebar';
import { HiAdjustmentsHorizontal} from "react-icons/hi2";


const Navbar = () => {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <header>
      <nav className="flex items-center justify-between p-4 bg-primary">
        <button onClick={() => setIsOpen(!isOpen)} className="text-white font-medium">
          Menu
        </button>
          <h1 className='text-primary-content'>Bienvenido</h1>
        <a href="#" className="text-white font-medium">Logo</a>
      </nav>
      <Sidebar isOpen={isOpen} setIsOpen={setIsOpen} />
    </header>
  );
}

export default Navbar;
