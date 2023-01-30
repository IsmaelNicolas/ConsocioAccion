import { createBrowserRouter } from "react-router-dom";
import Home, { loaderHome } from "../pages/Home";
import Login from "../pages/Login";
import Clients  from "../pages/Clients";
import NotFound from "../pages/NotFound";
import Logout,{loaderLogout} from "../components/Logout"
import LayoutPublic from "../layout/layoutPublic";

export const router = createBrowserRouter([
  {
    path: "/",
    element: <LayoutPublic />,
    errorElement: <NotFound />,
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
        path: "/login",
        element: <Login />,
      },
      {
        path: "/clients",
        element: <Clients />,
      },
      {
        path: "logout",
        element: <Logout/>,
        loader:loaderLogout
      }
    ],
  },
]);
