import React from 'react';
import {BrowserRouter as Router, Route, Link} from 'react-router-dom'
import signupForm from './signup-form';

export default class Header extends React.Component {
  render() {
    return (
      <div>
        <ul>
          <li><Link to="/">Home</Link></li>
          <li><Link to="/signin">Login</Link></li>
          <li><Link to="/signup">Signup</Link></li>
        </ul>
      </div>
    );
  }
}
