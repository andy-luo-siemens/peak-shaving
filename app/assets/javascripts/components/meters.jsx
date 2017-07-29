class Meters extends React.Component {
  getInitialState() {
    return { meters: this.props.data};
  }

  getDefaultProps() {
    return {meters: []};
  }

  render() {
    return(
      <div>
        <thead>
          <tr>
            <th>Name</th>
            <th>Address</th>
            <th>Controller</th>
            <th>Active?</th>
            <th>Plan</th>
          </tr>
        </thead>
        <table className='table table-bordered'>
          {this.state.records.map(function(meter) {
            return <Meter key={meter.id} meter={meter}/>
          }.bind(this))}
        </table>
      </div>
    );
  }
}
