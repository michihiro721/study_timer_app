// タイマー機能をインポート
import "packs/timer";

// DOMが完全に読み込まれた後に実行されるイベントリスナー
document.addEventListener('DOMContentLoaded', () => {
  // リセットボタンの確認ダイアログを設定
  const resetButton = document.getElementById('reset-button');
  if (resetButton) {
    resetButton.addEventListener('click', (event) => {
      if (!confirm('本当にリセットしますか？')) {
        event.preventDefault();
      }
    });
  }

  // スタンプが満タンになったときのクラッカーアニメーションを追加
  if (document.querySelector('.congratulations')) {
    for (let i = 0; i < 100; i++) {
      createConfetti();
    }
  }

  // クラッカーのアニメーションを作成する関数
  function createConfetti() {
    const confetti = document.createElement('div');
    confetti.classList.add('confetti');
    confetti.style.left = `${Math.random() * 100}%`;
    confetti.style.backgroundColor = getRandomColor();
    confetti.style.animationDelay = `${Math.random() * 2}s`;
    document.body.appendChild(confetti);

    // 3秒後にクラッカーを削除
    setTimeout(() => {
      confetti.remove();
    }, 3000);
  }

  // ランダムな色を生成する関数
  function getRandomColor() {
    const colors = ['#ff69b4', '#ff4500', '#ffd700', '#32cd32', '#1e90ff', '#8a2be2'];
    return colors[Math.floor(Math.random() * colors.length)];
  }
});