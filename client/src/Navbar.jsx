import React from "react";
import { Link } from "react-router-dom";
import "./navbar.css";

const Navbar = ({address}) => {
  return (
    <nav className="nav">
      <Link to="/browse">Browse</Link>
      <Link to={`/user/${address}`}>My Profile</Link>
    </nav>
  );
};

export default Navbar;
