import { createBrowserRouter } from "react-router-dom";
import Home from "../pages/Home";
import Login from "../pages/Login";
import Clients, { loaderBlogs } from "../pages/Clients";
import NotFound from "../pages/NotFound";
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
      },
      {
        path: "/home",
        element: <Home />,
      },
      {
        path: "/login",
        element: <Login />,
      },
      {
        path: "/clients",
        element: <Clients />,
      },
    ],
  },
]);
