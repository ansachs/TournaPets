import React from "react"
import ReactDOM from 'react-dom'
import PropTypes from "prop-types"
import 'src/bracket'
import MatchDisplay from 'match_display'


class bracket extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      rounds: 5,
      data: this.props.game,
      popup: false,
      popup_data: {},
      token: this.props.auth,
      current: {'backgroundColor': 'lightgreen'}
    }

  }

  createRound() {
    
    var output = Object.keys(this.state.data).map((round, round_num, array) => {
        let style;
        let tag;
        if (round_num === this.props.seeded - 2) {
            style = this.state.current;
            tag = <div id="round-tag">"Current Round"</div>
          } else {
            tag = <div>&nbsp;</div>
          }

        const output = ( 
          <ul className='round' style={style} key={round}> 
            {tag}
            {this.createMatch(round, round_num)}
            
          </ul>
          );

        return output;
    });

    const wrapped = (
      <div className='bracket'>
        {output}
      </div>
      )
    // console.log(test)
    return wrapped
  }

  createMatch(round, round_num) {
    // console.log(this.state.data[round])
    // return Object.keys
    return this.state.data[round].map((match, index, whole_round)=>{
          // console.log(this.state.sample[round][match])
          // console.log(whole_round)
          // console.log(index)

          let closing_li;
          let contestant_2;
          let spacer_game;
          const contestant_2_name = this.state.data[round][index]['contestant_2']
          const contestant_1_name = this.state.data[round][index]['contestant_1']
          const popup_data = this.state.data[round][index]

          if ( index === whole_round.length - 1) {
              closing_li = (<li className="spacer">&nbsp;</li>);
            }

          if (round_num < this.state.rounds -2) {
            // console.log('last')
            spacer_game = (<li className="game game-spacer">&nbsp;</li>);
            contestant_2 = (
              <li className="game game-bottom"><a href="" onClick={(event)=>{this.setPopup(event, popup_data)}}>{ contestant_2_name || " "}</a><span></span></li>);

          }

            let output = (
              <div className="match-div"key={index}>
                <li className="spacer">&nbsp;</li>
                <li className="game game-top"><a href="" onClick={(event)=>{this.setPopup(event, popup_data)}}>{contestant_1_name || " "}</a><span></span></li>
                {spacer_game}
                {contestant_2}
                {closing_li}
              </div>
            )
            // console.log(output)

            return output;
        });
  }

  populateBracket() {

  }

  getWinners() {

  }

  setPopup(event, popup_data) {
    // console.log('fadsfadsfasdfsdf')
    if (this.state.popup === true) {
      this.setState({popup: false, popup_data: {}})
    }
    else {
      this.setState({popup: true, popup_data: popup_data})
    }

    // console.log(popup_data)
    event.preventDefault()
  }



  render () {
    // console.log(this.props)
    const test = this.createRound();
    let popup;
    if (this.state.popup === true) {
      popup = <MatchDisplay popup_state={()=>{this.setState({popup: !this.state.popup})}} popup_data={this.state.popup_data} auth_token={this.state.token}/>
    }
    return (
        <div>
          {test}
          {popup}
        </div>
    );
  }
}

bracket.propTypes = {
  game: PropTypes.object,
  auth: PropTypes.string,
  seeded: PropTypes.number
};

export default bracket
