import gql from 'graphql-tag'

export default gql `
  mutation createUser($username: String!, $password: String!, $name: String!) {
    createUser(username: $username, password: $password, name: $name) {
      id
      name
      username
    }
  }
`;
