<?= view('templates/header'); ?>

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
    <link href="<?= base_url(); ?>/assets/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="<?= base_url(); ?>/assets/css/plugins/iCheck/custom.css" rel="stylesheet">
    <link href="<?= base_url(); ?>/assets/css/animate.css" rel="stylesheet">
    <link href="<?= base_url(); ?>/assets/css/style.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet">
    <link href="<?= base_url(); ?>/assets/css/auditView.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
    </script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
</head>




<div class="container">
    <div class="row">



        <div class="ibox">
            <div class="ibox-title">
                <h4>Accessibility Audit</h4>
                <button id="increase-font">Increase Font Size</button> <!-- increase font button -->

                <button id="decrease-font">Decrease Font Size</button> <!-- decrease font button-->

                <button id="grayscale-toggle">Toggle Greyscale</button>
                <!--grayscale button-->

                <button id="high-contrast-button">High Contrast</button>
                <!--high contrast button -->

                <button id="light-background">Light Background</button>
                <!--light background button -->

                <button id="negative-contrast-button">Negative Contrast</button>
                <!--negative contrast button -->

                <button id="reset-button">reset button</button>
                <!--reset button -->
                <div class="ibox-tools">
                </div>
            </div>
            <div class="ibox-content">
                <div class="m-b-sm m-t-sm">

                    <div class="input-group">

                        <input type="text" class="form-control form-control-sm">

                        <div class="input-group-append">
                            <button tabindex="-1" class="btn btn-primary btn-sm" type="button">Search</button>
                        </div>

                        <table class="table table-hover margin bottom">
                            <thead>
                                <tr>
                                    <th>Version</th>
                                    <th>Status</th>
                                    <th>View</th>
                                </tr>
                            </thead>
                            <tbody>

                                <?php foreach ($audit_data as $item){?>

                                <tr>
                                    <td><?= $item['audit_version'] ?></td>
                                    <td><?= $item['audit_prog'] ."/". $item['audit_total']  ?></td>
                                    <td class="text-center">
                                        <a class="btn btn-success btn-outline"
                                            href="/AuditController/openAudit/<?=$item['audit_id']?>" role="button"> View
                                            Audit(s)</a>
                                    </td>
                                </tr>
                                <?php }?>

                            </tbody>
                        </table>


                    </div>
                </div>


            </div>
        </div>

    </div>
</div>




<!-- Full screen modal -->


</div>


</body>

</html>