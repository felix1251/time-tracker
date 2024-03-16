import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="countdown"
export default class extends Controller {
  static targets = ["countdown"]

  connect() {
    this.secondsUntilEndTime = Number(this.countdownTarget.dataset.secondsUntilEndTime)
    this.countdown = setInterval(this.countdown.bind(this), 1000);
  }

  countdown() {
    const secondsPerDay = 86400;
    const secondsPerHour = 3600;
    const secondsPerMinute = 60;

    const hours = Math.floor(
      (this.secondsUntilEndTime % secondsPerDay) / secondsPerHour
    );
    const minutes = Math.floor(
      (this.secondsUntilEndTime % secondsPerHour) / secondsPerMinute
    );
    const seconds = Math.floor(this.secondsUntilEndTime % secondsPerMinute);
    
    this.countdownTarget.innerHTML = `${this.leadByZero(hours)}:${this.leadByZero(minutes)}:${this.leadByZero(seconds)}`;

    this.secondsUntilEndTime++;
  }

  leadByZero = (value) => {
    return value.toString().padStart(2, '0')
  }
}
