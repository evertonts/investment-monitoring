import React from 'react';
import {Route, Redirect} from "react-router-dom";

export default class PrivateRoute extends React.Component {
  render() {
    return (<Route path={this.props.path} render={() => {
      Component = this.props.component;

      if(window.currentUser) {
        <Component />
      }

      return (
        <Redirect to={{
          pathname: "/login",
          state: { from: props.location }
        }} />
      )
    }}/>)
  }
}
