import { Outlet, useLoaderData } from "react-router-dom";
import Footer from "../components/Footer";
import Header from "../components/Header";
import Admin from "../pages/Admin";

const LayoutPublic = () => {
  const { status, user } = useLoaderData();

  console.log(status, user);
  if (user.permissions == "admin") {
    return (
      <>
        <Admin />
      </>
    );
  }

  return (
    <>
      <Header />
      <Outlet />
      <Footer />
    </>
  );
};

export default LayoutPublic;

export const loaderPublic = async () => {
  const port = import.meta.env.PORT || "8080"
  console.log(import.meta.env)
  const data = await fetch("http://localhost:"+ port +"/api/user", {
    method: "GET",
    headers: {
      "Content-Type": "application/json",
    },
    credentials: "include",
  });
  const user = await data.json();
  const status = await data.status;
  console.log(status);
  return { status: status, user: user };
};
