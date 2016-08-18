import axios from 'axios';


axios.interceptors.request.use(function(config) {
	console.log('config');
	console.log(config);
	if (config.auth_me){
		console.log('auth_me');
		const token = localStorage.getItem('jwtToken');
		config.headers['x-access-token'] = token;
		console.log(token);

	}
	return config;
});

export default axios;
