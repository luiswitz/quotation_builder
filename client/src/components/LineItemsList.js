import React, { Component } from 'react';
import Table from 'react-bootstrap/Table';

class LineItemsList extends Component {
  render() {
    return(
      <Table striped bordered hover>
        <thead>
          <tr>
            <th>Product</th>
            <th>Price</th>
          </tr>
        </thead>
        <tbody>
          {
            this.props.line_items.map((line_item, idx) => (
              <tr key={idx}>
                <td>{line_item.name}</td>
                <td>{line_item.price}</td>
              </tr>
            ))
          }
        </tbody>
      </Table>
    );
  }
}

export default LineItemsList;
