const items = document.querySelectorAll(".items");
const selectionDiv = document.querySelector(".selection");
const myScore = document.querySelector("#myScore");
const computerScore = document.querySelector("#computerScore");
const resultDiv = document.querySelector(".result");
let selectionText;
let playerWins = 0;
let computerWins = 0;

for (let i = 0; i < items.length; i++) {
  let item = items[i];
  item.addEventListener("click", function(event) {
    if (playerWins < 5 && computerWins < 5) {
      selectionText = event.target.id;
      game();
      myScore.innerHTML = `My Score: ${playerWins}`;
      computerScore.innerHTML = `Computer Score: ${computerWins}`;
    } else {
      if (playerWins > computerWins) {
        resultDiv.innerHTML = "Game over! You Won!";
      } else if (playerWins < computerWins) {
        resultDiv.innerHTML = "Game over! Computer Won!";
      } else {
        resultDiv.innerHTML = "Game over! It's a draw!";
      }
    }
  })
}

function resultDisplay(playerSelection, computerSelection, whoWins) {
  resultDiv.classList.add("result-show");
  if (whoWins === "computer") {
    resultDiv.innerHTML = `Computer chose ${computerSelection}. You lose! ${computerSelection} beats ${playerSelection}`;
  } else if (whoWins === "you") {
    resultDiv.innerHTML = `Computer chose ${computerSelection}. You win! ${playerSelection} beats ${computerSelection}`;
  } else {
    resultDiv.innerHTML = `That was a tie`;
  }
}

function game() {
  let rounds = 1;

  function computerPlay() {
    let options = ["rock", "paper", "scissors"];
    let randomIndex = Math.floor(Math.random() * 3);
    return options[randomIndex];
  }

  function playRound() {
    let whoWins;
    let playerSelection = selectionText;
    if (playerSelection) {
      let computerSelection = computerPlay();
      if (playerSelection === "rock" && computerSelection === "paper") {
        computerWins += 1;
        whoWins = "computer";
        resultDisplay(playerSelection, computerSelection, whoWins);
      } else if (playerSelection === "paper" && computerSelection === "rock") {
        playerWins += 1;
        whoWins = "you";
        resultDisplay(playerSelection, computerSelection, whoWins);
      } else if (playerSelection === "scissors" && computerSelection === "rock") {
        computerWins += 1;
        whoWins = "computer";
        resultDisplay(playerSelection, computerSelection, whoWins);
      } else if (playerSelection === "rock" && computerSelection === "scissors") {
        playerWins += 1;
        whoWins = "you";
        resultDisplay(playerSelection, computerSelection, whoWins);
      } else if (playerSelection === "paper" && computerSelection === "scissors") {
        computerWins += 1;
        whoWins = "computer";
        resultDisplay(playerSelection, computerSelection, whoWins);
      } else if (playerSelection === "scissors" && computerSelection === "paper") {
        playerWins += 1;
        whoWins = "you";
        resultDisplay(playerSelection, computerSelection, whoWins);
      } else {
        resultDisplay(playerSelection, computerSelection, whoWins);
      }
    }
  }

  playRound();

}
