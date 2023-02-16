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
      background: #ffffff;
      display: none;

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

  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.0/font/bootstrap-icons.css">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">


  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css">

  <meta name="viewport" content="width=device-width, initial-scale=1.0">



  <link href="<?= base_url(); ?>/assets/font-awesome/css/font-awesome.css" rel="stylesheet">

  <link href="<?= base_url(); ?>/assets/css/plugins/iCheck/custom.css" rel="stylesheet">

  <link href="<?= base_url(); ?>/assets/css/plugins/fullcalendar/fullcalendar.css" rel="stylesheet">
  <link href="<?= base_url(); ?>/assets/css/plugins/fullcalendar/fullcalendar.print.css" rel='stylesheet' media='print'>

  <link href="<?= base_url(); ?>/assets/css/animate.css" rel="stylesheet">
  <link href="<?= base_url(); ?>/assets/css/style_theme.css" rel="stylesheet">

  <link href="<?= base_url(); ?>/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
  <link href="<?= base_url(); ?>/assets/css/plugins/iCheck/custom.css" rel="stylesheet">
  <link href="<?= base_url(); ?>/assets/css/animate.css" rel="stylesheet">

  <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet">
  <link href="<?= base_url(); ?>/assets/css/auditView.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
  </script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
</head>

<body>



  <div class="tab-container">
    <ul class="tab-list">
      <?php
                        $c = 1;
                        foreach ($question_data as $k => $v) {
                            echo '<li class="wizard-nav-item' . ($c == 1 ? " active" : "") . '" data-target="sec-' . $c . '"><a>' . $k . '</a></li>';
                            $c++;
                        }
                        ?>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active">

        <?php
                        $c=1;
                        foreach ($question_data as $k=>$v) {
                            echo '<section  id="sec-'.$c.'">';
                            echo '<h1>'. $k.'</h1>';
                            foreach ($question_data[$k] as $q_item){ ?>


        <div class="ibox qbox" id="qcontent-<?php echo $q_item['car_id']; ?>"
          data-id="<?php echo $q_item['car_id']; ?>">
          <div class="ibox-title bg-muted">
            <h3><strong><?php echo $q_item['question']; ?></strong></h3>
          </div>
          <div class="ibox-content">
            <div class="row">
              <div class="col-sm-6">
                <div class="respOptions">
                  <label class="radio-inline">
                    <input type="radio" name="resp-<?=$q_item['car_id']?>" value="1"
                      <?php if ($q_item['response'] == '1') echo 'checked="checked"'; ?>>
                    Yes
                  </label>
                  <label class="radio-inline">
                    <input type="radio" name="resp-<?=$q_item['car_id']?>" value="0"
                      <?php if ($q_item['response'] == '0') echo 'checked="checked"'; ?>>
                    No
                  </label>
                </div>
                <textarea class="text-notes form-control"
                  placeholder="Write comment..."><?= $q_item['notes']?></textarea>

              </div>
              <div class="col-sm-6">
                <!-- Image upload -->
                <div class="upload__box">
                  <div class="upload__btn-box">
                    <label class="btn btn-success ">
                      <i class="fa fa-camera"></i> Upload
                      <input type="file" multiple="" data-max_length="20" class="upload__inputfile">
                    </label>
                  </div>
                  <div class="upload__img-wrap"></div>
                </div>
              </div>
            </div>
          </div>
        </div>


        <?php }
                            echo '</section>';
                            $c++;
                        } ?>

      </div>
    </div>
  </div>

  <button class="btn btn-success btn-outline" id="scroll-to-top-btn"><i class="fa fa-chevron-circle-up"></i></button>

  <script>
    document.addEventListener('DOMContentLoaded', () => {
      imgUpload();
    });

    function imgUpload() {
      let imgWrap = "";
      let imgArray = [];

      document.querySelectorAll('.upload__inputfile').forEach(input => {
        input.addEventListener('change', (e) => {
          imgWrap = input.closest('.upload__box').querySelector('.upload__img-wrap');
          const maxLength = input.dataset.max_length;

          const files = e.target.files;
          const formData = new FormData();

          Array.from(files).forEach((file) => {
            if (file.type.match('image.*') && imgArray.length <= maxLength) {
              formData.append('images[]', file);
              imgArray.push(file);

              const reader = new FileReader();
              reader.onload = function (e) {
                const html =
                  `<div class='upload__img-box'><div style='background-image: url(${e.target.result})' data-number='${document.querySelectorAll(".upload__img-close").length}' data-file='${file.name}' class='img-bg'><div class='upload__img-close'></div></div></div>`;
                imgWrap.insertAdjacentHTML('beforeend', html);
              }
              reader.readAsDataURL(file);
            }
          });

          fetch('/AuditController/mediaUpload', {
              method: 'POST',
              body: formData
            })
            .then(response => response.json())
            .then(data => {
              if (data.success) {
                console.log('Uploaded files:', data.filenames);
              } else {
                console.error('Upload error:', data.errors);
              }
            })
            .catch(error => {
              console.error('Upload error:', error);
            });
        });
      });
    }




    document.querySelector('body').addEventListener('click', (e) => {
      if (e.target.matches('.upload__img-close')) {
        const file = e.target.closest('.img-bg').dataset.file;
        for (let i = 0; i < imgArray.length; i++) {
          if (imgArray[i].name === file) {
            imgArray.splice(i, 1);
            break;
          }
        }
        e.target.closest('.upload__img-box').remove();
      }
    });
  </script>




  <script>
    var navLinks = document.querySelectorAll('.wizard-nav-item');
    navLinks.forEach(function (link) {
      link.addEventListener('click', function (e) {
        e.preventDefault();
        var target = document.getElementById(link.getAttribute('data-target'));
        target.scrollIntoView({
          behavior: 'smooth'
        });
      });
    });
  </script>


  <script>
    document.querySelectorAll('.qbox').forEach(qbox => {
      qbox.addEventListener('change', () => {
        const id = parseInt(qbox.getAttribute('data-id'));
        const textarea = qbox.querySelector('textarea');
        const textareaValue = textarea.value;

        const radioButton = qbox.querySelector('input[type="radio"]:checked');
        const radioButtonValue = radioButton.value;

        let data = {
          id: id,
          notes: textareaValue,
          response: radioButtonValue
        };

        fetch('/AuditController/addResponse', {
            method: 'POST',
            headers: {
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
          })
          .then(response => {
            if (response.ok) {
              // Display success message
              toastr.success('Response added successfully');
            } else {
              // Display error message
              toastr.error('An error occurred');
            }
          })
          .catch(error => {
            // Display error message
            toastr.error('An error occurred');
            console.error(error);
          });

      });
    });
  </script>

  <script>
    const sections = document.querySelectorAll('section');
    const observer = new IntersectionObserver((entries) => {
      let minDistance = Number.POSITIVE_INFINITY;
      let closestSection = null;
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          const distance = Math.abs(entry.boundingClientRect.top);
          if (distance < minDistance) {
            minDistance = distance;
            closestSection = entry.target;
          }
        }
      });
      if (closestSection) {
        console.log(`Closest heading to top: ${closestSection.id}`);
        const activeTab = document.querySelector('.wizard-nav-item.active');
        const targetTab = document.querySelector(`.wizard-nav-item[data-target="${closestSection.id}"]`);
        if (activeTab !== targetTab) {
          activeTab.classList.remove('active');
          targetTab.classList.add('active');
        }
      }
    });
    sections.forEach((section) => {
      observer.observe(section);
    });

    const scrollToTopButton = document.getElementById('scroll-to-top-btn');

    scrollToTopButton.addEventListener('click', () => {
      const tabPane = document.querySelector('.tab-pane');
      tabPane.scrollIntoView({
        behavior: 'smooth'
      });
    });
  </script>

</body>

</html>