import React from 'react';
import {Query} from "react-apollo";
import gql from 'graphql-tag'

import CurrentUser from '../store/current-user'
const query = gql `
  query {
    me {
      id
      username
      name
    }
  }
`;

export default class Dashboard extends React.Component {
  render() {
    return (
      <Query path={this.props.path} query={query}>
        {({ loading, error, data }) => {
          if(loading) return <p>...</p>
          window.currentUser = new CurrentUser(data.me)

          return (
            <h1>{window.currentUser.name}</h1>
          );
        }}
      </Query>
    )
  }
}
