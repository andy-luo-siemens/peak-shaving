
class Meters extends React.Component {

  constructor(props) {
    super(props)
    this.state = {meters: props.data}
  }


  render() {
    return(
      <div className='container'>
        <h1>Hello Meters Table!</h1>
        <table className='table table-bordered'>
          <thead>
            <tr>
              <th>Name</th>
              <th>Address</th>
              <th>Controller</th>
              <th>Active?</th>
              <th>Plan</th>
            </tr>
          </thead>
          <tbody>
            {this.state.meters.map(function(meter) {
              return(
                <Meter key={meter.id} meter={meter}/>
              )
            }.bind(this))}
            </tbody>
        </table>
      </div>
    );
  }
}
