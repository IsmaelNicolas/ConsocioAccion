const Alert = ({ message, title, show, handleClose }) => {
  return show ? (
    <div className="card w-96 bg-red-100 shadow-2xl z-100">
      <div className="card-body">
        <h2 className="card-title text-error">{title}!!</h2>
        <p>{message}</p>
        <div className="card-actions justify-end">
          <button className="btn btn-error text-base-100" onClick={handleClose}>Aceptar</button>
        </div>
      </div>
    </div>
  ) : null;
};

export default Alert;
