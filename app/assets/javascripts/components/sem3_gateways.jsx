class Sem3Gateways extends React.Component {
  constructor(props) {
    super(props)
    this.state = {sem3_gateways: props.data}
  }

  render() {
    return (
      <div className='container'>
        <h1>Hello SEM3 Gateways Table!</h1>
        <table className='table table-bordered'>
          <thead>
            <tr>
              <th>Name</th>
              <th>MAC Address</th>
            </tr>
          </thead>
          <tbody>
            {this.state.sem3_gateways.map(function(sem3_gateway) {
              return(
                  <Gateway key={sem3_gateway.id} sem3_gateway={sem3_gateway}/>
              )
            }.bind(this))}
          </tbody>
        </table>
      </div>
    )
  }
}
