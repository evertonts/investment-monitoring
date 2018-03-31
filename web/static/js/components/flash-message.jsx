import React from 'react';

export default class FlashMessage extends React.Component {
  constructor(props) {
    super(props)
    this.state = {message: null, level: null }
    window.flashMessage = this;
  }

  addMessage(message, level) {
    this.setState({message: message, level: level})
  }

  render() {
    if(!this.state.message)
      return (null);
    return (
      <div className={`flash-message ${this.props.level}`}>
        {this.state.message}
      </div>
    )
  }
}
