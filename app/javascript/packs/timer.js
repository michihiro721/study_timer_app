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

  const totalDurationElement = document.getElementById('total-duration');
  if (totalDurationElement) {
    let totalSeconds = parseDuration(totalDurationElement.textContent);

    const updateTotalDuration = () => {
      totalSeconds += 1;
      totalDurationElement.textContent = formatDuration(totalSeconds);
    };

    setInterval(updateTotalDuration, 1000);
  }
});

const parseDuration = (duration) => {
  const match = duration.match(/(\d+)時間(\d+)分(\d+)秒/);
  if (match) {
    const hours = parseInt(match[1], 10);
    const minutes = parseInt(match[2], 10);
    const seconds = parseInt(match[3], 10);
    return hours * 3600 + minutes * 60 + seconds;
  }
  return 0;
};

const formatDuration = (totalSeconds) => {
  const hours = Math.floor(totalSeconds / 3600);
  const minutes = Math.floor((totalSeconds % 3600) / 60);
  const seconds = totalSeconds % 60;
  return `${hours}時間${minutes}分${seconds}秒`;
};
