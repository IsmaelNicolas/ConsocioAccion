const RegisterItem = ({ text, type ,name, defaultValue,onChange}) => {
  return (
    <div className="form-control w-full ml-2">
      <label className="label">
        <span className="label-text">{text}</span>
      </label>
      <input
        type={type}
        placeholder={text}
        name={name}
        onChange={onChange}
        defaultValue={defaultValue}
        required
        className="input input-bordered w-full bg-orange-50"

      />
    </div>
  );
};

export default RegisterItem;
