import React from "react"
import {graphql} from 'react-apollo'
import mutation from '../graphql/mutations/create-user'

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

    this
      .props
      .mutate({variables: this.state})
      .then(({data}) => {
        console.log('got data', data);
      })
      .catch((error) => {
        console.log('error', error);
      });
  }

  render() {
    return (
      <div>
        <h1>Login</h1>
      </div>
    )
  }
}

export default graphql(mutation)(SignInForm);
