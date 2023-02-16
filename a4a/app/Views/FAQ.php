<div class="container">
    <style>
@import url('https://fonts.googleapis.com/css?family=Hind:300,400&display=swap');

$bg: #fff;
$text: #7288a2;
$gray: #4d5974;
$lightgray: #e5e5e5;
$blue: #03b5d2;

* {
  box-sizing: border-box;
  &::before, &::after {
    box-sizing: border-box;
  }
}

body {
  margin: 0;
  padding: 0;
  font-family: 'Hind', sans-serif;
  background: $bg;
  color: $gray;
  display: flex;
  min-height: 100vh;
}

.container {
  margin: 0 auto;
  padding: 4rem;
  width: 48rem;
}

.accordion {
  .accordion-item {
    border-bottom: 1px solid $lightgray;
    button[aria-expanded='true'] {
      border-bottom: 1px solid $blue;
    }
  }
  button {
    position: relative;
    display: block;
    text-align: left;
    width: 100%;
    padding: 1em 0;
    color: $text;
    font-size: 1.15rem;
    font-weight: 400;
    border: none;
    background: none;
    outline: none;
    &:hover, &:focus {
      cursor: pointer;
      color: $blue;
      &::after {
        cursor: pointer;
        color: $blue;
        border: 1px solid $blue;
      }
    }
    .accordion-title {
      padding: 1em 1.5em 1em 0;
    }
    .icon {
      display: inline-block;
      position: absolute;
      top: 18px;
      right: 0;
      width: 22px;
      height: 22px;
      border: 1px solid;
      border-radius: 22px;
      &::before {
        display: block;
        position: absolute;
        content: '';
        top: 9px;
        left: 5px;
        width: 10px;
        height: 2px;
        background: currentColor;
      }
      &::after {
        display: block;
        position: absolute;
        content: '';
        top: 5px;
        left: 9px;
        width: 2px;
        height: 10px;
        background: currentColor;
      }
    }
  }
  button[aria-expanded='true'] {
    color: $blue;
    .icon {
      &::after {
        width: 0;
      }
    }
    + .accordion-content {
      opacity: 1;
      max-height: 9em;
      transition: all 200ms linear;
      will-change: opacity, max-height;
    }
  }
  .accordion-content {
    opacity: 0;
    max-height: 0;
    overflow: hidden;
    transition: opacity 200ms linear, max-height 200ms linear;
    will-change: opacity, max-height;
    p {
      font-size: 1rem;
      font-weight: 300;
      margin: 2em 0;
    }
  }
}
</style>
  <h2>Frequently Asked Questions</h2>
  <div class="accordion">
    <div class="accordion-item">
      <button id="accordion-button-1" aria-expanded="false"><span class="accordion-title">Why is the moon sometimes out during the day?</span><span class="icon" aria-hidden="true"></span></button>
      <div class="accordion-content">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum sagittis vitae et leo duis ut. Ut tortor pretium viverra suspendisse potenti.</p>
      </div>
    </div>
    <div class="accordion-item">
      <button id="accordion-button-2" aria-expanded="false"><span class="accordion-title">Why is the sky blue?</span><span class="icon" aria-hidden="true"></span></button>
      <div class="accordion-content">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum sagittis vitae et leo duis ut. Ut tortor pretium viverra suspendisse potenti.</p>
      </div>
    </div>
    <div class="accordion-item">
      <button id="accordion-button-3" aria-expanded="false"><span class="accordion-title">Will we ever discover aliens?</span><span class="icon" aria-hidden="true"></span></button>
      <div class="accordion-content">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum sagittis vitae et leo duis ut. Ut tortor pretium viverra suspendisse potenti.</p>
      </div>
    </div>
    <div class="accordion-item">
      <button id="accordion-button-4" aria-expanded="false"><span class="accordion-title">How much does the Earth weigh?</span><span class="icon" aria-hidden="true"></span></button>
      <div class="accordion-content">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum sagittis vitae et leo duis ut. Ut tortor pretium viverra suspendisse potenti.</p>
      </div>
    </div>
    <div class="accordion-item">
      <button id="accordion-button-5" aria-expanded="false"><span class="accordion-title">How do airplanes stay up?</span><span class="icon" aria-hidden="true"></span></button>
      <div class="accordion-content">
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Elementum sagittis vitae et leo duis ut. Ut tortor pretium viverra suspendisse potenti.</p>
      </div>
    </div>
  </div>
</div>
<script>
const items = document.querySelectorAll(".accordion button");

function toggleAccordion() {
  const itemToggle = this.getAttribute('aria-expanded');
  
  for (i = 0; i < items.length; i++) {
    items[i].setAttribute('aria-expanded', 'false');
  }
  
  if (itemToggle == 'false') {
    this.setAttribute('aria-expanded', 'true');
  }
}

items.forEach(item => item.addEventListener('click', toggleAccordion));

</script>