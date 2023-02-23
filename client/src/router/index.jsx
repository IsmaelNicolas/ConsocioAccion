import { createBrowserRouter } from "react-router-dom";
import Home, { loaderHome } from "../pages/Home";
import Login from "../pages/Login";
import Clients, { loaderClients }  from "../pages/Clients";
import Client, { loaderClient } from "../pages/Client"
import NotFound from "../pages/NotFound";
import Logout,{loaderLogout} from "../components/Logout"
import LayoutPublic,{loaderPublic} from "../layout/layoutPublic";
import Register from "../pages/Register";
import SearchClient from "../pages/SearchClient";
import RegisterDocument from "../pages/RegisterDocuments";
import RegisterSpouse from "../pages/RegisterSpouse";
import Admin, { loaderAdmin } from "../pages/Admin";

export const router = createBrowserRouter([
  {
    path: "/login",
    element: <Login />,
  },
  {
    path: "/admin",
    element: <Admin/>,
    loader: loaderAdmin
  },
  {
    path: "/",
    element: <LayoutPublic />,
    errorElement: <NotFound />,
    loader: loaderPublic,
    children: [
      {
        index: true,
        element: <Home />,
        loader: loaderHome
      },
      {
        path: "/home",
        element: <Home />,
        loader: loaderHome
      },
      {
        path: "/clients",
        element: <Clients />,
        loader: loaderClients
      },
      {
        path: "/clients/search",
        element: <SearchClient/>
      },
      {
        path: "/clients/:idClient",
        element: <Client/>,
        loader: loaderClient,
        errorElement: <SearchClient/>
      },
      {
        path:"/clients/register",
        element: <Register/>
      },
      {
        path: "/clients/stage1",
        element: <RegisterDocument/>
      },
      {
        path: "/clients/register/spouse",
        element: <RegisterSpouse/>
      },
      {
        path: "logout",
        element: <Logout/>,
        loader:loaderLogout
      }
    ],
  },
]);
