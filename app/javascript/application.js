// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails"
// import "./controllers"
import "packs/timer";

// import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
// import * as ActiveStorage from "@rails/activestorage"
// import "channels"

// Rails.start()
// Turbolinks.start()
// ActiveStorage.start()

document.addEventListener('DOMContentLoaded', () => {
  const resetButton = document.getElementById('reset-button');
  if (resetButton) {
    resetButton.addEventListener('click', (event) => {
      if (!confirm('本当にリセットしますか？')) {
        event.preventDefault();
      }
    });
  }
});

document.addEventListener('DOMContentLoaded', function() {
  if (document.querySelector('.congratulations')) {
    // クラッカーのアニメーションを追加
    for (let i = 0; i < 100; i++) {
      createConfetti();
    }
  }

  function createConfetti() {
    const confetti = document.createElement('div');
    confetti.classList.add('confetti');
    confetti.style.left = `${Math.random() * 100}%`;
    confetti.style.backgroundColor = getRandomColor();
    confetti.style.animationDelay = `${Math.random() * 2}s`;
    document.body.appendChild(confetti);

    setTimeout(() => {
      confetti.remove();
    }, 3000);
  }

  function getRandomColor() {
    const colors = ['#ff69b4', '#ff4500', '#ffd700', '#32cd32', '#1e90ff', '#8a2be2'];
    return colors[Math.floor(Math.random() * colors.length)];
  }
});