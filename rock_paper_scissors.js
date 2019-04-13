function game() {
  let rounds = 3;
  let playerWins = 0;
  let computerWins = 0;

  function computerPlay() {
    let options = ["rock", "paper", "scissors"];
    let randomIndex = Math.floor(Math.random() * 3);
    return options[randomIndex];
  }

  function playRound() {
    let playerSelection = prompt("Enter your selection:").toLowerCase();
    let computerSelection = computerPlay();
    if (playerSelection === "rock" && computerSelection === "paper") {
      computerWins += 1;
      console.log("You lose! Paper beats Rock");
    } else if (playerSelection === "paper" && computerSelection === "rock") {
      playerWins += 1;
      console.log("You win! Paper beats Rock");
    } else if (playerSelection === "scissors" && computerSelection === "rock") {
      computerWins += 1;
      console.log("You lose! Rock beats Scissors");
    } else if (playerSelection === "rock" && computerSelection === "scissors") {
      playerWins += 1;
      console.log("You win! Rock beats Scissors");
    } else if (playerSelection === "paper" && computerSelection === "scissors") {
      computerWins += 1;
      console.log("You lose! Scissors beats Paper");
    } else if (playerSelection === "scissors" && computerSelection === "paper") {
      playerWins += 1;
      console.log("You win! Scissors beats Paper");
    } else {
      console.log("That was a tie!");
    }
  }

  for(let i = 0; i < rounds; i++) {
    playRound();
    console.log(playerWins, computerWins);
  }
  
  if (playerWins > computerWins) {
    console.log("You won the Game!");
  } else {
    console.log("You lost the Game!");
  }
}

console.log(game());
