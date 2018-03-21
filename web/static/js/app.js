import React from 'react'
import ReactDOM from 'react-dom'
import LoginForm from './components/login-form'
import {ApolloProvider} from 'react-apollo'
import {ApolloClient} from 'apollo-client'
import {HttpLink} from 'apollo-link-http'
import {InMemoryCache} from 'apollo-cache-inmemory'

const httpLink = new HttpLink()
const client = new ApolloClient({link: httpLink, cache: new InMemoryCache()})

ReactDOM.render(
  <ApolloProvider client={client}>
  <LoginForm />
  </ApolloProvider>, document.getElementById('hello-world'))
