import React, { Component } from 'react'; 
import axios from '../axios-auth'; 
import classNames from 'classnames';

//const server = 'http://10.0.0.98:9000';
const server = 'http://home.suyash.io';
const FunctionButton = props => { 
	const callFunction = () => { 
		return axios.get(`${server}/send/${props.deviceName}/${props.functionName}`, {auth_me: true}).then(response => {console.log(response)}); 
	};

	const buttonClass = classNames({
		'btn': true,
		'btn-lg': true,
		'btn-default': !props.type,
		'btn-success': props.type==='success', 
		'btn-primary': props.type==='primary',
		'btn-danger': props.type==='danger',
	});

	return (
		<button className={buttonClass} onClick={callFunction}>{props.actionText}</button>
	) 
};

export default FunctionButton;
