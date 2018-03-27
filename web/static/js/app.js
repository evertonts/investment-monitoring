import React from 'react'
import ReactDOM from 'react-dom'
import {BrowserRouter} from 'react-router-dom'
import {ApolloProvider} from 'react-apollo'
import {ApolloClient} from 'apollo-client'
import {HttpLink} from 'apollo-link-http'
import {InMemoryCache} from 'apollo-cache-inmemory'
import {Route} from 'react-router-dom'

import SignUpForm from './components/signup-form'
import SignInForm from './components/signin-form'
import Header from './components/header'

const httpLink = new HttpLink()
const client = new ApolloClient({link: httpLink, cache: new InMemoryCache()})

class App extends React.Component {
  render() {
    return (
      <BrowserRouter >
        <div>
          <Header />
          <Route exact path="/" component={SignInForm}/>
          <Route path="/signup" component={SignUpForm}/>
          <Route path="/signin" component={SignInForm}/>
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
