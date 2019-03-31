import React, { Component } from 'react';
import AlertComponent from './AlertComponent';
import UserForm from './UserForm';
import LineItemsForm from './LineItemsForm';
import QuotationReport from './QuotationReport';
import axios from 'axios';

class QuotationForm extends Component {
  state = {
    step: 1,
    user: {
      name: '',
      email: '',
      password: '',
      phone_number: '',
    },
    line_items: [],
    quotation: {},
    alert: {
      visible: false,
      text: '',
      variant: ''
    }
  }

  onInputChange = (e) => {
    this.setState({
      user: {
        ...this.state.user,
        [e.target.name]: e.target.value
      }
    });
  }

  handleNextStep = () => {
    this.setState({
      step: this.state.step + 1
    });
  }

  handlePrevStep = () => {
    this.setState({
      step: this.state.step - 1
    });
  }

  handleAddProduct = (e) => {
    this.setState({
      line_items: this.state.line_items.concat(e)
    })
  }

  onStartAgain = (e) => {
    this.setState({
      step: 2,
      line_items: [],
      alert: {
        visible: false,
        text: ''
      }
    })
  }

  onSubmitQuotation = (e) => {
    e.preventDefault();

    const quotation = {
      user: this.state.user,
      line_items: this.state.line_items
    }

    axios.post('http://127.0.0.1:3001/quotations', { quotation })
      .then(res => {
        this.setState({
          quotation: res.data,
          step: 3,
          alert: {
            visible: true,
            text: 'Quotation successfully created',
            variant: 'success'
          } 
        })
      }).catch(error => {
        const errors = error.response.data.errors;
        console.log(errors);

        this.setState({
          line_items: [],
          alert: {
            visible: true,
            text: errors[0],
            variant: 'danger'
          } 
        })
      })
  }

  render() {
    const { step } = this.state;
    const { line_items } = this.state;

    const user = this.state.user

    switch(step) {
      case 1:
        return(
          <UserForm
            onInputChange={this.onInputChange}
            handleNextStep={this.handleNextStep}
            user={user}
          />
        );
      case 2:
        return(
          <div>
            <AlertComponent alert={this.state.alert} />
            <LineItemsForm 
              handlePrevStep={this.handlePrevStep}
              handleAddProduct={this.handleAddProduct}
              onSubmitQuotation={this.onSubmitQuotation}
              line_items={line_items}
            />
          </div>
        )
      case 3:
        return(
          <div>
            <AlertComponent alert={this.state.alert} />
            <QuotationReport
              quotation={this.state.quotation}
              onStartAgain={this.onStartAgain}
            />
          </div>
        )
    }
  }
}

export default QuotationForm;
