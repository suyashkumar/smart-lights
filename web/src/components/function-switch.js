import React, { Component } from 'react';
import FunctionButton from './function-button';
import axios from '../axios-auth';

const server = 'http://home.suyash.io'; 
class FunctionSwitch extends Component {
	constructor(props){ 
		super(props);
		this.state = {
			currentStatus: ''
		}
		this.refreshStatus = this.refreshStatus.bind(this);
		this.changeStatus = this.changeStatus.bind(this);
		this.refreshStatus();
	}

	refreshStatus() {
		axios.get(`${server}/api/send/${this.props.deviceName}/${this.props.statusFunction}`, {auth_me: true}).then(response => {
			if(response.data.success) this.setState({currentStatus: response.data.data});
		});
	}

	changeStatus(data) { 
		this.setState({currentStatus: data});
	}

	renderStatus() {
		return (
			<div>Current Status: <span className="label label-primary">{this.state.currentStatus}</span> </div>
		)
	}

	render() { 
		// Display only the button switch layout for now: 
		return (
			<div className="well" style={{width: '90%', marginLeft: 'auto', marginRight: 'auto', marginBottom: '20px'}}>
				<div className="text-center row" style={{marginBottom: '20px'}}>
					<h5> {this.props.title}</h5>  
					{(this.props.statusFunction) ? this.renderStatus() : null}
				</div>
				<div className="text-center spaced row"> 
					<FunctionButton
						actionText="On"
						deviceName={this.props.deviceName}
						type="success"
						changeStatus={this.changeStatus}
						functionName={this.props.functionNameOn} /> 
					<FunctionButton
						actionText="Off"
						deviceName={this.props.deviceName}
						type="danger"
						changeStatus={this.changeStatus}
						functionName={this.props.functionNameOff} /> 
				</div>
			</div> 
		);
	} 
}

export default FunctionSwitch;
