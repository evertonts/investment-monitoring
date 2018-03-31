import React from 'react';
import {Link} from 'react-router-dom'
import FlashMessage from './flash-message'

export default class Header extends React.Component {
  render() {
    return (
      <div>
        <ul>
          <li><Link to="/">Home</Link></li>
          <li><Link to="/signin">Login</Link></li>
          <li><Link to="/signup">Signup</Link></li>
        </ul>
        <FlashMessage/>
      </div>
    );
  }
}
