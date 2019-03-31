import React, { Component } from 'react';
import PriceFactorsForm from './PriceFactorsForm';
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import Col from 'react-bootstrap/Col';
import Row from 'react-bootstrap/Row';
import Table from 'react-bootstrap/Table';
import LineItemsList from './LineItemsList'
import axios from 'axios';

class LineItemsForm extends Component {
  state = {
    selected_product: '',
    kind: '',
    products: [],
    price_factors_form: false
  }

  componentDidMount() {
    axios.get('http://localhost:3001/products')
      .then(res => {
        const products = res.data;
        this.setState({ products: products.data });
      });
  }

  onProductChange = (e) => {
    const { options, selectedIndex, value } = e.target
    const { products } = this.state;

    const selected = products.find(product => product.id == value);

    if(selected) {
      this.setState({
        selected_product: {
          id: selected.id,
          name: selected.name,
          kind: selected.kind,
          price: selected.price,
          price_factors: this.state.price_factors
        },
        kind: selected.kind,
        price_factors_form: true
      });
    } else {
      this.setState({price_factors_form: false});
    }
  }

  onPriceFactorsChange = (e) => {
    this.setState({
      selected_product: {
        ...this.state.selected_product,
        price_factors: { 
          ...this.state.selected_product.price_factors,
          [e.target.name]: e.target.value
        }
      }
    })
  }

  render() {
    const { handleAddProduct } = this.props;
    const products = this.state.products;

    return(
      <div>
        <h1>Line Items</h1>

        <Form>
          <Form.Control onChange={this.onProductChange} as='select'>
            <option>Choose a Product</option>
            {
              products.map(product => (
                <option key={product.id} value={product.id}>
                    {product.name} - Price: {product.price}
                </option>
              ))
            }
          </Form.Control>
        </Form>

        <br />
        <PriceFactorsForm 
          onChange={this.onPriceFactorsChange}
          type={this.state.kind}
          visible={this.state.price_factors_form}
        />
        <br />

        <Row>
          <Col><Button block variant='outline-danger' onClick={this.props.handlePrevStep}>Back</Button></Col>
          <Col>
            <Button block onClick={() => handleAddProduct(this.state.selected_product)}>
                Add Product
            </Button>
          </Col>
          <Col><Button block variant='success' onClick={this.props.onSubmitQuotation}>Submit Quotation</Button></Col>
        </Row>

        <br />
        <LineItemsList line_items={this.props.line_items} />
      </div>
    );
  }
}

export default LineItemsForm;
