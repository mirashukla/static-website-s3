const choices = ["rock", "paper", "scissors"];

document.querySelectorAll(".choice").forEach(button => {
    button.addEventListener("click", playGame);
});

function playGame(event) {
    const playerChoice = event.target.dataset.choice;
    const computerChoice = getComputerChoice();

    const result = getGameResult(playerChoice, computerChoice);
    displayResult(result, playerChoice, computerChoice);
}

function getComputerChoice() {
    const randomIndex = Math.floor(Math.random() * choices.length);
    return choices[randomIndex];
}

function getGameResult(player, computer) {
    if (player === computer) {
        return "It's a tie!";
    }

    if (
        (player === "rock" && computer === "scissors") ||
        (player === "paper" && computer === "rock") ||
        (player === "scissors" && computer === "paper")
    ) {
        return "You win!";
    }

    return "Computer wins!";
}

function displayResult(result, playerChoice, computerChoice) {
    const resultElement = document.querySelector(".result");
    resultElement.textContent = `You chose ${playerChoice}, the computer chose ${computerChoice}. ${result}`;
}
