import React, { Component } from 'react';
import Alert from 'react-bootstrap/Alert';

class AlertComponent extends Component {
  render() {
    let component;
    const { alert } = this.props;

    console.log(alert);

    if(alert.visible) {
      component = <Alert variant={alert.variant}>{alert.text}</Alert>
    } else {
      component = null;
    }

    return(
      <div>
          {component}
      </div>
    )
  }
}

export default AlertComponent;
