//Create component example
var Testing = React.createClass({
    render: function () {
      return (
        <h4>This is a react test!</h4>
        )
      }
    });
  
  //rendering element example
  function tick() {
      const element = (
            <span>Local Time: {new Date().toLocaleTimeString()}</span>
      );
      ReactDOM.render(
        element,
        document.getElementById('testing')
      );
    }
  
    setInterval(tick, 1000);
  