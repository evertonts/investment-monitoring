import gql from 'graphql-tag'

export default gql `
  mutation createsession($username: String!, $password: String!) {
    createUser(username: $username, password: $password) {
      token
    }
  }
`;
