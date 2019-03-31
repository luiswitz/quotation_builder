import React, { Component } from 'react';
import QuotationForm from './components/QuotationForm';
import Container from 'react-bootstrap/Container';

class App extends Component {
  render() {
    return (
      <Container>
        <QuotationForm />
      </Container>
    );
  }
}

export default App;
