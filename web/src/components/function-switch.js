import React, { Component } from 'react';
import FunctionButton from './function-button';
class FunctionSwitch extends Component {

	render() {
		// Display only the button switch layout for now: 
		return (
			<div className="well" style={{width: '90%', margin: 'auto'}}>
				<div className="text-center row" style={{marginBottom: '20px'}}>
					<h5> {this.props.title} | Current Status: ON </h5>
				</div>
				<div className="text-center spaced row"> 
					<FunctionButton
						actionText="On"
						deviceName={this.props.deviceName}
						type="success"
						functionName={this.props.functionNameOn} /> 
					<FunctionButton
						actionText="Off"
						deviceName={this.props.deviceName}
						type="danger"
						functionName={this.props.functionNameOff} /> 
				</div>
			</div> 
		);
	} 
}

export default FunctionSwitch;
