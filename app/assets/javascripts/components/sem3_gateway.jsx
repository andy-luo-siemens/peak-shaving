class Sem3Gateway extends React.Component {
  recordRow() {
    return (
      <tr>
        <td>{this.props.sem3_gateway.name}</td>
        <td>{this.props.sem3_gateway.mac_address}</td>
      </tr>
    );
  }

  render() {
    return this.recordRow();
  }
}
