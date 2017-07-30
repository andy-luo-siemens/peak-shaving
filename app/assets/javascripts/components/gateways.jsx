//table of MAC Address, Name
class gateways extends React.Component {
  render () {
    return (
      <div className='container'>
        <h1>Hello Gateways Table!</h1>
        <table className='table table-bordered'>
          <thead>
            <tr>
              <th>Name<</th>
              <th>MAC Address</th>
            </tr>
          </thead>
          <tbody>
            {this.state.gateways.map(function(gateway)) {
              return(
                  <Gateway key={gateway.id} gateway={gateway}/>
              )
            }.bind(this))}
          </tbody>
        </table>
      </div>
    )
  }
}
