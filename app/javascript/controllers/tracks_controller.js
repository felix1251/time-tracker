import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tracks"
export default class extends Controller {
  static targets = ["item", "total", "list"]

  connect() {
    this.calculate()

    // Create an observer instance
    const observer = new MutationObserver(() => this.calculate());

    // detect if chiild element is changing 
    observer.observe(this.element, { childList: true });
  }

  calculate() {
    if(this.itemTargets.length == 0){
      this.element.remove()
      return;
    }

    this.totalSeconds = 0

    this.itemTargets.forEach(element => {
      this.totalSeconds += Number(element.dataset.seconds)
    });

    const secondsPerHour = 3600;
    const secondsPerMinute = 60;

    const hours = Math.floor(
      this.totalSeconds / secondsPerHour
    );

    const minutes = Math.floor(
      (this.totalSeconds % secondsPerHour) / secondsPerMinute
    );

    const seconds = Math.floor(this.totalSeconds % secondsPerMinute);

    this.totalTarget.innerHTML = `${this.leadByZero(hours)}:${this.leadByZero(minutes)}:${this.leadByZero(seconds)}`;
  }

  leadByZero = (value) => {
    return value.toString().padStart(2, '0')
  }
}
