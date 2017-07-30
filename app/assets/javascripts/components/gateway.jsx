class Gateway extends React.Component {
  recordRow() {
    return (
      <tr>
        <td>{this.props.gateway.name}</td>
        <td>{this.props.gateway.mac_address}</td>
      </tr>
    )
  }

  render() {
    return this.recordRow();
  }
}
