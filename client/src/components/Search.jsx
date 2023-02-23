import { MdSearch } from "react-icons/md";

const Search = ({ onClick, onChange,text }) => {
  return (
    <div className="form-control">
      <div className="input-group">
        <input
          type="text"
          placeholder={text}
          onChange={onChange}
          className="input input-bordered"
        />
        <button
          className="btn btn-square"
          onClick={onClick}
        >
          <MdSearch className="text-2xl" />
        </button>
      </div>
    </div>
  );
};

export default Search;
