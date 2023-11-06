let timerInterval;
let seconds = 0;
let minutes = 0;
let hours = 0;

const timerDisplay = document.getElementById("timer");
const startButton = document.getElementById("start");
const stopButton = document.getElementById("stop");
const resetButton = document.getElementById("reset");

function startTimer() {
    startButton.disabled = true;
    timerInterval = setInterval(updateTimer, 1000);
}

function stopTimer() {
    startButton.disabled = false;
    clearInterval(timerInterval);
}

function resetTimer() {
    startButton.disabled = false;
    clearInterval(timerInterval);
    seconds = 0;
    minutes = 0;
    hours = 0;
    updateTimerDisplay();
}

function updateTimer() {
    seconds++;
    if (seconds === 60) {
        seconds = 0;
        minutes++;
        if (minutes === 60) {
            minutes = 0;
            hours++;
        }
    }
    updateTimerDisplay();
}

function updateTimerDisplay() {
    const formattedTime = `${String(hours).padStart(2, "0")}:${String(minutes).padStart(2, "0")}:${String(seconds).padStart(2, "0")}`;
    timerDisplay.textContent = formattedTime;
}

startButton.addEventListener("click", startTimer);
stopButton.addEventListener("click", stopTimer);
resetButton.addEventListener("click", resetTimer);
