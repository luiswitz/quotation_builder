import React, { Component } from 'react';
import Form from 'react-bootstrap/Form';

class SubscriptionsPriceFactorsForm extends Component {
  render() {
    return(
      <Form>
        <Form.Label>Start Date</Form.Label>
        <Form.Control type='date' name='start_date' onChange={this.props.onChange}/>

        <Form.Label>End Date</Form.Label>
        <Form.Control type='date' name='end_date' onChange={this.props.onChange}/>
      </Form>
    )
  }
}

export default SubscriptionsPriceFactorsForm;
