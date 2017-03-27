import React from 'react';
import ReactDOM from 'react-dom'; 
import { Router, Route, Link, IndexRoute, browserHistory } from 'react-router'
import App from './App';
import './index.css';
import login from './components/login';
import Home from './components/home';

ReactDOM.render(
  (
  	<Router>
		<Route path="/" component={App}>
			<IndexRoute component={Home}/>	
			<Route path="login" component={login} /> 
		</Route>

	</Router> 
  ),
  document.getElementById('root')
);
