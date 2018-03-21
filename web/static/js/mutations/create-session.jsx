import LoginForm from "../components/login-form";
import {graphql} from 'react-apollo'
import gql from 'graphql-tag'

const CREATE_USER_MUTATION = gql `
  mutation createUser($username: string!, $password: string!, $name: string!) {
    user {
      id
      name
      username
    }
  }
`
export default graphql(CREATE_USER_MUTATION, {name: 'createUserMutation'})(LoginForm)
