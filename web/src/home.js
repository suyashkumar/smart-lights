import React from 'react';
import FunctionSwitch from './components/function-switch';

const Home = props => {
	return (
		<FunctionSwitch
			title="Room Lights"
			deviceName="suyash"
			functionNameOn="lightsOn"
			functionNameOff="lightsOff" /> 
	); 
}
export default Home;
