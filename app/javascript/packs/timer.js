// DOMが完全に読み込まれた後に実行されるイベントリスナー
document.addEventListener("DOMContentLoaded", () => {
  // タイマー表示要素を取得
  const timerDisplay = document.getElementById("timer-display");
  if (timerDisplay) {
    // タイマーの開始時間を取得
    let startTime = new Date(timerDisplay.dataset.startTime);

    // タイマーを更新する関数
    const updateTimer = () => {
      const currentTime = new Date();
      const elapsedSeconds = Math.floor((currentTime - startTime) / 1000);
      const hours = Math.floor(elapsedSeconds / 3600);
      const minutes = Math.floor((elapsedSeconds % 3600) / 60);
      const seconds = elapsedSeconds % 60;
      timerDisplay.textContent = `${hours}時間 ${minutes}分 ${seconds}秒`;
    };

    // 1秒ごとにタイマーを更新
    setInterval(updateTimer, 1000);
  }

  // 累計時間表示要素を取得
  const totalDurationElement = document.getElementById('total-duration');
  if (totalDurationElement) {
    // 累計時間を秒単位で取得
    let totalSeconds = parseDuration(totalDurationElement.textContent);

    // 累計時間を更新する関数
    const updateTotalDuration = () => {
      totalSeconds += 1;
      totalDurationElement.textContent = formatDuration(totalSeconds);
    };

    // 1秒ごとに累計時間を更新
    setInterval(updateTotalDuration, 1000);
  }
});

// 時間の文字列を秒単位に変換する関数
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

// 秒単位の時間を「xx時間xx分xx秒」の形式に変換する関数
const formatDuration = (totalSeconds) => {
  const hours = Math.floor(totalSeconds / 3600);
  const minutes = Math.floor((totalSeconds % 3600) / 60);
  const seconds = totalSeconds % 60;
  return `${hours}時間${minutes}分${seconds}秒`;
};
