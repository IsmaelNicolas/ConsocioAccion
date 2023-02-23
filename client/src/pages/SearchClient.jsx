import { useState } from "react";
import { useNavigate } from "react-router-dom";
import Search from "../components/Search";

const SearchClient = () => {
  const [nui, setNui] = useState();
  const navigate = useNavigate();

  const handleChange = (event) => {
    setNui(event.target.value);
  };

  const handleSubmit = () => {
    navigate("/clients/"+nui)
  };

  return (
    <div className="h-screen bg-base-200 flex justify-center">
      <div className="pt-20 w-5/6">
        <div className="card w-full bg-base-100 shadow-xl">
          <div className="card-body flex flex-row justify-between">
            <h2 className="card-title w-full flex justify-center ">
              <span className="mr-2">Buscar por cedula:</span>
              <Search onChange={handleChange} onClick={handleSubmit} text={"Cedula"}/>
            </h2>
            <h2 className="card-title w-full flex justify-center">
              <span className="mr-2">Buscar por apellido:</span>
              <Search onChange={handleChange} onClick={handleSubmit} text={"Apellidoo"}/>
            </h2>
          </div>
        </div>
      </div>
    </div>
  );
};

export default SearchClient;
