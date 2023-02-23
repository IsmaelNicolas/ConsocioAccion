import CardClient from "../components/CardClient";

const ShowClients = ({ clients }) => {
  return (
    <div className="grid flex-grow bg-base-200 mt-12 ">
      <div className="flex flex-wrap justify-center">
        {clients.map((client, index) => (
          <CardClient
            title={client.Name_client + " " + client.Lastname_client}
            body={client.Phone_client}
          />
        ))}
      </div>
    </div>
  );
};

export default ShowClients;
