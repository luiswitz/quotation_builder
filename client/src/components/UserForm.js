import React, { Component } from 'react';
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';

class UserForm extends Component {
  render() {
    const user = this.props.user;

    return(
      <div>
        <h1>User Details</h1>

        <Form>
          <Form.Label>Name</Form.Label>
          <Form.Control type='text' name='name' value={user.name} onChange={this.props.onInputChange}/>
          <Form.Label>Email</Form.Label>
          <Form.Control type='text' name='email' value={user.email} onChange={this.props.onInputChange}/>
          <Form.Label>Password</Form.Label>
          <Form.Control type='password' name='password' value={user.password} onChange={this.props.onInputChange}/>
          <Form.Label>Phone</Form.Label>
          <Form.Control type='text' name='phone_number' value={user.phone_number} onChange={this.props.onInputChange}/>
          <br />
          <Button onClick={this.props.handleNextStep} block>Next</Button>
        </Form>
      </div>
    );
  }
}

export default UserForm;
