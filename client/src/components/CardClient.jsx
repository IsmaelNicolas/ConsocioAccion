const CardClient = ({ title, body}) => {
  return (
      <div className="card w-96 bg-base-100 shadow-xl mt-5 mr-5 md:w-1/4 lg:w-1/5">
        <div className="card-body">
          <h2 className="card-title">{title}</h2>
          <p>{body}</p>
        </div>
      </div>
  );
};

export default CardClient;
