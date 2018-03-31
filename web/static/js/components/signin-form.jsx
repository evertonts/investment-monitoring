import React from "react"
import {graphql} from 'react-apollo'
import mutation from '../graphql/mutations/create-session'

class SignInForm extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      username: '',
      password: ''
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
    self = this;

    this.props.mutate({variables: this.state})
      .then(({data}) => {
        console.log('data', data)
        localStorage.setItem('token', data.createSession.token);
        self.props.history.push('/dashboard')
      })
      .catch((error) => {
        console.log('error', error)

        window.flashMessage.addMessage('username or password inválid', 'info')
      });
  }

  render() {
    return (
      <div>
        <h1>Login</h1>

        <form onSubmit={this.handleOnSubmit}>
          <label>Username</label>
          <input type="text" name="username" onChange={this.handleInputChange}/>
          <br />
          <label>Password</label>
          <input type="password" name="password" onChange={this.handleInputChange}/>

          <input type="submit" value="Submit"/>
        </form>
      </div>
    )
  }
}

export default graphql(mutation)(SignInForm);
