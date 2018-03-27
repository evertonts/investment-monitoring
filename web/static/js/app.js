import React from 'react'
import ReactDOM from 'react-dom'
import SignUpForm from './components/signup-form'
import {ApolloProvider} from 'react-apollo'
import {ApolloClient} from 'apollo-client'
import {HttpLink} from 'apollo-link-http'
import {InMemoryCache} from 'apollo-cache-inmemory'

const httpLink = new HttpLink()
const client = new ApolloClient({link: httpLink, cache: new InMemoryCache()})

class App extends React.Component {
  render() {
    return (<SignUpForm/>)
  }
}

ReactDOM.render(
  <ApolloProvider client={client}>
    <App />
  </ApolloProvider>, document.getElementById('container'))
