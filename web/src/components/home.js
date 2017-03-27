import React from 'react';
import FunctionSwitch from './function-switch';

const Home = props => {
	return (
	<div>
		<FunctionSwitch
			title="Room Lights"
			deviceName="suyash"
			functionNameOn="lightsOn"
			functionNameOff="lightsOff" 
			statusFunction="lightsStatus"/> 
		<FunctionSwitch
			title="LED Light"
			deviceName="suyash"
			functionNameOn="ledToggle"
			functionNameOff="ledToggle" />
	</div>

	); 
}
export default Home;
