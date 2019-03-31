import React, { Component } from 'react';
import GoodsPriceFactorsForm from './GoodsPriceFactorsForm';
import ServicePriceFactorsForm from './ServicePriceFactorsForm';
import SubscriptionsPriceFactorsForm from './SubscriptionsPriceFactorsForm';
import Col from 'react-bootstrap/Col';
import Row from 'react-bootstrap/Row';

class PriceFactorsForm extends Component {
  components = {
    goods: GoodsPriceFactorsForm,
    subscription: SubscriptionsPriceFactorsForm,
    service: ServicePriceFactorsForm
  }

  render() {
    const TypeName = this.components[this.props.type || 'goods'];
    const { visible } = this.props;
    let component;

    if(visible) {
      component = <TypeName onChange={this.props.onChange} />
    } else {
      component = null;
    }

    return(
      <Row>
        <Col>
          {component}
        </Col>
      </Row>
    )
  }
}

export default PriceFactorsForm;
