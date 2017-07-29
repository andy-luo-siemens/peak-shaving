class Meter extends React.Component {


  recordRow() {
    return(
      <tr>
      // name, address, parent controller, isActive, belongs to peak shaving plan
        <td>{this.props.meter.name}</td>
        <td>{this.props.meter.address}</td>
        <td>{this.props.meter.sem3_controller_name}</td>
        <td>{this.props.meter.is_active}</td>
        //dropdown menu for existing peak shaving plans, none as default option
      </tr>
    );
  }

  render() {
    return this.recordRow();
  }



}
