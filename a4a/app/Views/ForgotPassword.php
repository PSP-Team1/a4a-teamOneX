<!DOCTYPE html>
<html lang="en">


<head>
<style>
      .grayscale {
        filter: grayscale(100%);
  -webkit-filter: grayscale(100%);
  }
 
      </style>
<style>
  .light-background {
    display: block;
  }
  #white-image {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -1;
  }
</style>

  <style>
  .high-contrast {
    background: black;
    color: white;
    filter: invert(100%);
  }
</style>
<style>
.negative-contrast {
  filter: invert(1) hue-rotate(180deg);
  background: black;
}
</style>
    <link rel="shortcut icon" href="./assets/img/favicon.ico">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">
    <link rel="stylesheet" href="./assets/css/loginStyle_new.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link rel="stylesheet" href="./assets/css/accessiblity.css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js"></script>


</head>

<script>
    toastr.options.progressBar = true;
</script>`

<body class="animate__animated animate__fadeIn">
<div class="dropdown">
        <button href="#accessibilityModal" data-bs-toggle="modal" class="btn btn-secondary floating-btn" type="button">
        <b>A</b>
        </button>
        </div>

        <div class="login-container">

<section class="Login-form">

    <div class="fusion-separator fusion-no-medium-visibility fusion-no-large-visibility fusion-full-width-sep"
        style="align-self: center;margin-left: auto;margin-right: auto;margin-top:80px;margin-bottom:10px;width:100%;">
    </div>

    <style>
            body {
                background-image: url('https://images.wallpaperscraft.com/image/single/texture_spots_lemon_143188_1920x1080.jpg');
                background-repeat: no-repeat;
                background-attachment: fixed;
                background-size: cover;
            }
        </style>


        <div id="accessibilityModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Accessibility Features</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">

                    <button class="btn btn-secondary" id="increase-font">Increase Font Size</button> <!-- increase font button -->

                    <button class="btn btn-secondary" id="decrease-font">Decrease Font Size</button> <!-- decrease font button-->

                    <hr>

                    <button class="btn btn-secondary" id="negative-contrast-button">Negative Contrast</button><!--negative contrast button -->

                    <button class="btn btn-secondary" id="high-contrast-button">High Contrast</button> <!--high contrast button -->

                    <hr>

                    <button class="btn btn-secondary" id="grayscale-toggle">Toggle Greyscale</button> <!--grayscale button-->

                    <button class="btn btn-secondary" id="light-background">Light Background</button> <!--light background button -->
                            
                    </div>
                    <div class="modal-footer">
                    <button class="btn btn-secondary" id="reset-button">Reset</button><!--reset button -->
                        <button type="button" class="btn btn-secondary"
                            data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

    <div class="wrapper">

        <div class="loginRight ">
            <div class="login-container">

                <section class="Login-form">


                    <div class="form-content">

                    <div>
                        <h3 style="text-shadow: 1px 1px 1px white; color: black; text-align: center;">Password Reset</h3>
                    </div>

                        <hr>

                        <?php if (session()->getFlashdata('msg')) : ?>
                          <div class="alert alert-warning">
                                <?= session()->getFlashdata('msg') ?>
                            </div>
                        <?php endif; ?>
                        <form action="<?php echo base_url(); ?>/LoginController/forgotPasswordAuth" method="post">
                            <div class="form-group mb-3">
                                <input required type="email" name="email" placeholder="Email" value="<?= set_value('email') ?>" class="form-control">
                            </div>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-success">Request Password Reset</button>
                            </div>

                            <hr>

                            <div class="d-grid">
                                <a href="<?= base_url() ?>/login" class="btn btn-light">Return To Login</a>
                            </div>
                        </form>
                    </div>
                </section>
            </div>
        </div>
    </div>

    <script>
          const showPasswordBtn = document.getElementById('show-password-btn');
          const passwordField = document.querySelector('input[name="password"]');

          showPasswordBtn.addEventListener('click', () => {
              if (passwordField.type === 'password') {
                  passwordField.type = 'text';
                  showPasswordBtn.textContent = 'Hide';
                  toastr.info('Password Shown');
              } else {
                  passwordField.type = 'password';
                  showPasswordBtn.textContent = 'Show';
                  toastr.info('Password Hidden');
              }
          });
      </script>
    <!--increase font js-->
<script>

const increaseFontBtn = document.querySelector("#increase-font");
  let fontSize = 14;

  increaseFontBtn.addEventListener("click", () => {
    fontSize += 2;
    document.querySelectorAll("body *").forEach(el => {
      el.style.fontSize = `${fontSize}px`;
    });
  });


  </script>

<!--decrease font-->
<script>
const decreaseFontBtn = document.querySelector("#decrease-font");

decreaseFontBtn.addEventListener("click", () => {
  fontSize -= 2;
  document.querySelectorAll("body *").forEach(el => {
    el.style.fontSize = `${fontSize}px`;
  });
});

</script>

<!--grayscale-->
<script>
// get the button and the HTML tag
const toggleButton = document.getElementById('grayscale-toggle');
const htmlTag = document.getElementsByTagName('html')[0];

// function to toggle the grayscale filter
function toggleGrayscale() {
  if (htmlTag.classList.contains('grayscale')) {
    htmlTag.classList.remove('grayscale');
  } else {
    htmlTag.classList.add('grayscale');
  }
}

// add event listener to the button
toggleButton.addEventListener('click', toggleGrayscale);
</script>


<script>
  const lightBackgroundBtn = document.querySelector("#light-background");

  function toggleLightBackground() {
    const body = document.querySelector("body");
    const whiteImage = document.createElement("img");
    whiteImage.setAttribute("src", "assets/img/whitebackground.jpg");
    whiteImage.setAttribute("id", "white-image");
    
    if (body.style.backgroundColor) {
      body.style.backgroundColor = "";
      const existingImage = document.querySelector("#white-image");
      if (existingImage) {
        existingImage.remove();
      }
    } else {
      body.style.backgroundColor = "#ffffff";
      body.appendChild(whiteImage);
    }
  }

  lightBackgroundBtn.addEventListener("click", toggleLightBackground);
</script>

<!--high contrast-->
<script>

  const button = document.getElementById('high-contrast-button');
  button.addEventListener('click', function() {
    document.body.classList.toggle('high-contrast');
  });

  </script>
<!--negative contrast-->
<script>
const buttons = document.getElementById('negative-contrast-button');
  buttons.addEventListener('click', function() {
    document.body.classList.toggle('negative-contrast');
  });
</script>

<!--reset button-->
<script>
const resetButton = document.getElementById('reset-button');

resetButton.addEventListener('click', () => {
  // Remove grayscale filter
  document.getElementsByTagName('html')[0].classList.remove('grayscale');
  // Remove high contrast filter
  document.body.classList.remove('high-contrast');
  // Remove negative contrast filter
  document.body.classList.remove('negative-contrast');
  // Remove light background
  document.body.style.backgroundColor = '';
  image.style.display = "block";
  // Reset font size
  document.querySelectorAll('body *').forEach(el => {
    el.style.fontSize = '';
  });
});
</script>
</body>
</html>