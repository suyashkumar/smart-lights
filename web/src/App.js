import React, { Component } from 'react';
import FunctionButton from './components/function-button.js';
import Footer from './components/footer.js';
import './App.css';
class App extends Component {
  render() {
    return (
      <div className=""> 
		<div className="row">
			<div className="text-center header">
				<h4> Suyash's Lights </h4>	
			</div>
		</div>
		<div>
		{this.props.children}
		</div>
		<div className="text-center row">
			<Footer />
		</div> 
      </div>
    );
  }
}

export default App;
