import React,{ Component } from 'react'
import AnswerShow from './AnswerShow'
import AnswerForm from './AnswerForm'
class AnswerContainer extends Component{
  constructor(props){
    super(props);
    this.state={
      answers: [],
      question_id: ''
    }
    this.handleSubmit = this.handleSubmit.bind(this)
  }
  // handleSubmit(formPayload){
  //   // debugger;
  //   fetch('/api/v1/answers', {
  //     method: 'POST',
  //     body: JSON.stringify(formPayload)
  //   })
  //   .then(response => response.json())
  //   .then(body => {
  //     this.setState({answers: this.state.answers.concat(body)})
  //   })
  // }

  handleSubmit(formPayload){
  fetch('/api/v1/answers', {
    method: 'POST',
    body: JSON.stringify(formPayload)
  }).then(response => {
    let body = response.json()
    return body
  }).then(body => {
    // debugger;
    this.setState({ answers: [...this.state.answers, body] })
  })
}

  // componentDidMount(){
  //   fetch('/api/v1/answers')
  //   .then(response => response.json())
  //   .then(body => {
  //     // console.log(body.questions.answers)
  //     this.setState({answers: body.questions})
  //   })
  // }
  componentDidMount() {
    // let articleId = this.props.params.id;
    let answerId = document.getElementById('show').getAttribute('data-id');
    fetch(`/api/v1/answers/${answerId}`)
    .then(response => response.json())
    .then(body => {
      // console.log(body.id)
      this.setState({answers: body, question_id: answerId})
    });
    // FETCH ARTICLE BY ID
  }
  render(){
    let answers = this.state.answers.map(answer => {
      return(
        <AnswerShow
          key={answer.id}
          id={answer.id}
          description={answer.description}
        />
      )
    })

    console.log(this.state.question_id)
    // debugger;
    return(
      <div>
        <AnswerForm handleSubmit={this.handleSubmit} question_id={this.state.question_id}/>
        {answers}
      </div>
    )
  }
}


export default AnswerContainer
