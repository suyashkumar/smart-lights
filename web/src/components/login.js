import React, { Component } from 'react';
import axios from '../util/axios-auth';
import { server } from '../util/constants';

class login extends Component{
	constructor(props) {
		super(props);
		this.state = {
			email: '',
			password: ''
		} 
		this.handleLogin = this.handleLogin.bind(this);
		this.handleEmailChange = this.handleEmailChange.bind(this);
		this.handlePasswordChange = this.handlePasswordChange.bind(this);
	}

	handleLogin() {
		axios.post(`${server}/api/auth`, {
			email: this.state.email,
			password: this.state.password
		}).then(response => { 
				if(response.data.success) {
					localStorage.setItem('jwtToken', response.data.token); 
					this.props.history.push('/');
				}
		});
	}

	handleEmailChange(e) {
		this.setState({email: e.target.value});
	}

	handlePasswordChange(e) {
		this.setState({password: e.target.value}); 
	} 

	handlePasswordKeyPress = (e) => {
		if (e.key == 'Enter') {
			this.handleLogin();
		}
	}

	render(){
		return (
			<div className="text-center">
				<div style={{paddingBottom: '10px'}}> 
					<input 
						type="text" 
						onChange={this.handleEmailChange} 
						value={this.state.email}/> 
				</div>
				<div style={{paddingBottom: '10px'}}> 
					<input 
						type="password" 
						onChange={this.handlePasswordChange} 
						onKeyPress={this.handlePasswordKeyPress}
						value={this.state.password}/> 
				</div>
				<button 
					className="btn btn-success" 
					onClick={this.handleLogin}> 
				Submit 
				</button>
			</div> 
		);
	}

};

export default login;

