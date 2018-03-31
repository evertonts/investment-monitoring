import React from 'react'
import ReactDOM from 'react-dom'
import {BrowserRouter} from 'react-router-dom'
import {ApolloProvider} from 'react-apollo'
import {ApolloClient} from 'apollo-client'
import {HttpLink} from 'apollo-link-http'
import {InMemoryCache} from 'apollo-cache-inmemory'
import {Route} from 'react-router-dom'
import {setContext} from 'apollo-link-context';

import SignUpForm from './components/signup-form'
import SignInForm from './components/signin-form'
import Header from './components/header'
import Dashboard from './components/dasboard'
import PrivateRoute from './components/private-route'

const authLink = setContext((_, {headers}) => {
  // get the authentication token from local storage if it exists
  const token = localStorage.getItem('token');
  // return the headers to the context so httpLink can read them
  return {
    headers: {
      headers,
      authorization: token
        ? `Bearer ${token}`
        : ""
    }
  }
});

const httpLink = new HttpLink()
const client = new ApolloClient({link: authLink.concat(httpLink), cache: new InMemoryCache()})

class App extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    return (
      <BrowserRouter >
        <div>
          <Header />
          <Route exact path="/" component={Dashboard}/>
          <Route path="/signup" component={SignUpForm}/>
          <Route path="/signin" component={SignInForm}/>
          <PrivateRoute path="/dashboard" component={Dashboard}/>
        </div>
      </BrowserRouter>
    )
  }
}

ReactDOM.render(
  <BrowserRouter>
    <ApolloProvider client={client}>
      <App />
    </ApolloProvider>
  </BrowserRouter>, document.getElementById('container')
)
