import React from 'react';
import FunctionSwitch from './function-switch';

const Home = props => {
	return (
	<div>
		<FunctionSwitch
			title="Room Lights"
			deviceName="suyash_1"
			functionNameOn="lightsOn"
			functionNameOff="lightsOff" 
			statusFunction="lightsStatus"/> 
		<FunctionSwitch
			title="LED Light"
			deviceName="suyash_1"
			functionNameOn="ledToggle"
			functionNameOff="ledToggle" />
	</div>

	); 
}
export default Home;
