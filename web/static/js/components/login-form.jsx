import React from "react"
import {graphql} from 'react-apollo'
import gql from 'graphql-tag'

class LoginForm extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      name: '',
      username: '',
      password: '',
    };

    this.handleInputChange = this
      .handleInputChange
      .bind(this);
    this.handleOnSubmit = this
      .handleOnSubmit
      .bind(this)
  }

  handleInputChange(event) {
    const target = event.target;
    const value = target.value;
    const name = target.name;

    this.setState({[name]: value});
  }

  handleOnSubmit(event) {
    event.preventDefault();

    this.props.mutate({
      variables: this.state
    })
    .then(({data}) => {
      console.log('got data', data);
    }).catch((error) => {
      console.log('error', error);
    });
  }

  render() {
    return (
      <div>
        <h1>Cadastro</h1>
        <form onSubmit={this.handleOnSubmit}>
          <label>Name:</label>
          <input
            type="text"
            name="name"
            value={this.state.name}
            onChange={this.handleInputChange}/>
          <br/>
          <label>Email:</label>
          <input
            type="email"
            name="username"
            value={this.state.username}
            onChange={this.handleInputChange}/>
          <br />
          <label>Password:</label>
          <input
            type="password"
            name="password"
            value={this.state.password}
            onChange={this.handleInputChange}/>
          <br />
          <input type="submit" value="Submit"/>
        </form>
      </div>
    )
  }
}

const query = gql `
  mutation createUser($username: String!, $password: String!, $name: String!) {
    createUser(username: $username, password: $password, name: $name) {
      id
      name
      username
    }
  }
`;

export default graphql(query)(LoginForm);
