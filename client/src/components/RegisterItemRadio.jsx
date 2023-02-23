const RegisterItemSelect = ({ text, value,name, options,onChange }) => {
  return (
    <div className="form-control w-full max-w-xs mr-4">
      <label className="label">
        <span className="label-text">{text}</span>
      </label>
      <select className="select select-bordered bg-orange-50" value={value} name={name}
      onChange={onChange} required>
        <option disabled selected>
          {text}
        </option>
        {options.map((option, index) => (
          <option key={index} value={option}>
            {option}
          </option>
        ))}
      </select>
    </div>
  );
};

export default RegisterItemSelect;
