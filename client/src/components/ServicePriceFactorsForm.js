import React, { Component } from 'react';
import Form from 'react-bootstrap/Form';

class ServicePriceFactorsForm extends Component {
  render() {
    return(
      <Form>
        <Form.Label>Day of the Week</Form.Label>
        <Form.Control as='select' name='day_of_the_week' onChange={this.props.onChange}>
          <option>Choose the day of the week</option>
          <option value={1}>Monday</option>
          <option value={2}>Thursday</option>
          <option value={3}>Wednesday</option>
          <option value={4}>Thursday</option>
          <option value={5}>Friday</option>
          <option value={6}>Saturday</option>
        </Form.Control>

        <Form.Label>Number of Weeks</Form.Label>
        <Form.Control type='number' name='number_of_weeks' onChange={this.props.onChange}/>

        <Form.Label>Start Time</Form.Label>
        <Form.Control as='select' name='start_time' onChange={this.props.onChange}>
          <option value=''>Choose the Start Time</option>
          <option value='09:00'>09:00</option>
          <option value='10:00'>10:00</option>
          <option value='11:00'>11:00</option>
          <option value='12:00'>12:00</option>
          <option value='13:00'>13:00</option>
          <option value='14:00'>14:00</option>
          <option value='15:00'>15:00</option>
          <option value='16:00'>16:00</option>
          <option value='17:00'>17:00</option>
          <option value='18:00'>18:00</option>
        </Form.Control>

        <Form.Label>End Time</Form.Label>
        <Form.Control as='select' name='end_time' onChange={this.props.onChange}>
          <option value=''>Choose the End Time</option>
          <option value='10:00'>10:00</option>
          <option value='11:00'>11:00</option>
          <option value='12:00'>12:00</option>
          <option value='13:00'>13:00</option>
          <option value='14:00'>14:00</option>
          <option value='15:00'>15:00</option>
          <option value='16:00'>16:00</option>
          <option value='17:00'>17:00</option>
          <option value='18:00'>18:00</option>
          <option value='19:00'>19:00</option>
        </Form.Control>
      </Form>
    )
  }
}

export default ServicePriceFactorsForm;
