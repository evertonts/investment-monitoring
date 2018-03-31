import gql from 'graphql-tag'

export default gql `
  mutation createSession($username: String!, $password: String!) {
    createSession(username: $username, password: $password) {
      token
    }
  }
`;
