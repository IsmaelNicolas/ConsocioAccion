import { Link } from "react-router-dom"
import log from "../assets/log.svg"


const Logo = ()=>{

    return(
        <Link to={"/"}>
            <img src={log} className="w-auto h-auto object-cover"/>
        </Link>
    )

}

export default Logo