import React, {Component} from 'react';
import Table from 'react-bootstrap/Table';
import Card from 'react-bootstrap/Card';
import Button from 'react-bootstrap/Button';

class QuotationReport extends Component {
  render() {
    const { quotation } = this.props;

    return (
      <div>
        <Card>
          <Card.Header as="h5">Quotation Report</Card.Header>
          <Card.Body>
            <Card.Title>Here are your quotation details</Card.Title>
            <Card.Title>Number: {quotation.id} - Total: { quotation.total }</Card.Title>
            <Card.Text>
            </Card.Text>
            <Button variant="primary" onClick={this.props.onStartAgain}>Start Again</Button>
          </Card.Body>
        </Card>

        <Table striped bordered hover>
          <thead>
            <tr>
              <th>Product</th>
              <th>Details</th>
              <th>Price</th>
            </tr>
          </thead>
          <tbody>
            {
              quotation.line_items.map(line_item => (
                <tr key={line_item.id}>
                  <td>{line_item.name}</td>
                  <td>{line_item.details}</td>
                  <td>{line_item.price}</td>
                </tr>
              ))
            }
          </tbody>
        </Table>
      </div>
    )
  }
}

export default QuotationReport;

