import React from "react";
import { Link, useLoaderData } from "react-router-dom";

const Clients = () => {
  const { blogs } = useLoaderData();
  console.log(blogs);

  return (
    <div className="flex w-full">
      <div className="grid h-20 flex-grow card bg-base-300 rounded-box place-items-center">
        content
      </div>
      <div className="divider divider-horizontal">OR</div>
      <div className="grid h-20 flex-grow card bg-base-300 rounded-box place-items-center">
        content
      </div>
    </div>
  );
};

export default Clients;
