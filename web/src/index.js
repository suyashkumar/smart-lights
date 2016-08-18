import React from 'react';
import ReactDOM from 'react-dom'; 
import { Router, Route, Link, IndexRoute, browserHistory } from 'react-router'
import App from './App';
import './index.css';
import login from './login';
import Home from './home';

ReactDOM.render(
  (
  	<Router history={browserHistory}>
		<Route path="/" component={App}>
			<IndexRoute component={Home}/>	
			<Route path="login" component={login} /> 
		</Route>

	</Router> 
  ),
  document.getElementById('root')
);
