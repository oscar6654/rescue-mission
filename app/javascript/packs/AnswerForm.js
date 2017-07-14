import React, { Component } from 'react';

class AnswerForm extends Component{
  constructor(props){
    super(props)
    this.state = {
      description: ''
    }
    this.addAnswer = this.addAnswer.bind(this);
    this.handleChange = this.handleChange.bind(this)
    this.handleClear = this.handleClear.bind(this)
  }
  handleClear(event){
    event.preventDefault();
    this.setState({description: ""})
  }
  handleChange(event){
    this.setState({description:event.target.value})
  }
  addAnswer(event){
    event.preventDefault();
    let formPayload ={
      description: this.state.description,
      question_id: this.props.question_id
    }
    this.props.handleSubmit(formPayload)
    this.handleClear(event)
  }
  render(){
    return(
      <form onSubmit={this.addAnswer}>
        <label>Answer
          <input
            name='description'
            type='text'
            value={this.state.description}
            id='description'
            onChange={this.handleChange}
          />
        </label>
        <div className="button-group">
          <button className="button" onClick={this.handleClear}>Clear</button>
          <input className="button" type="submit" value="Submit" />
        </div>
      </form>
    )
  }

}


export default AnswerForm
