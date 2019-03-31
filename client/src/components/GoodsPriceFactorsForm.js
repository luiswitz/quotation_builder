import React, { Component } from 'react';
import Form from 'react-bootstrap/Form';

class GoodsPriceFactors extends Component {
  render() {
    return(
      <Form>
        <Form.Label>Quantity</Form.Label>
        <Form.Control type='number' name='quantity' onChange={this.props.onChange}/>
      </Form>
    )
  }
}

export default GoodsPriceFactors;
