document.addEventListener("DOMContentLoaded", () => {
  const timerDisplay = document.getElementById("timer-display");
  console.log(timerDisplay); //#コンソールタブに表示される
  if (timerDisplay) {
    let startTime = new Date(timerDisplay.dataset.startTime);
    const updateTimer = () => {
      const currentTime = new Date();
      const elapsedSeconds = Math.floor((currentTime - startTime) / 1000);
      const hours = Math.floor(elapsedSeconds / 3600);
      const minutes = Math.floor((elapsedSeconds % 3600) / 60);
      const seconds = elapsedSeconds % 60;
      timerDisplay.textContent = `${hours}時間 ${minutes}分 ${seconds}秒`;
    };
    
    setInterval(updateTimer, 1000);
  }
});
