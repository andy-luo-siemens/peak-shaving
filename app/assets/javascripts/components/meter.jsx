class Meter extends React.Component {


  recordRow() {
    return(
      <tr>

        <td>{this.props.meter.name}</td>
        <td>{this.props.meter.address}</td>
        <td>{this.props.meter.sem3_controller_id}</td>
        <td>{this.props.meter.is_active}</td>

      </tr>
    );
  }

  render() {
    return this.recordRow();
  }



}
