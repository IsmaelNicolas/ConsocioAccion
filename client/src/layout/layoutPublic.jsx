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

  const data = await fetch("http://toorblue.com:8080/api/user", {
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
