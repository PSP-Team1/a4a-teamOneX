<?= view('templates/header');

date_default_timezone_set('Europe/London');

$hour = date('G');
$timeOfDay = "";

if ($hour >= 5 && $hour <= 11) {
    $timeOfDay .= "Good Morning,";
} else if ($hour >= 12 && $hour <= 18) {
    $timeOfDay .= "Good Afternoon,";
} else if ($hour >= 19 || $hour <= 4) {
    $timeOfDay .= "Good Evening,";
}



$session = session();
$user = $session->get('name');



?>


<div class="container">


    <div class="row">
        <div class="col-lg-6">

        </div>
        <div class="ibox ">
            <div class="ibox-title">
                <h2>Client Dashboard</h2>
            </div>

            <div class="ibox-content">


                <div class="row">
                    <h3><?php echo $timeOfDay . " ".  $user?>!</h3>
                    <h4>What would you like to do today?</h4>
                    <h5>Quick Links</h5>
                    <p>
                        <a class="btn btn-success btn-outline" href="/createTemplate" role="button"> <i
                                class="fa fa-plus "></i> Create Template(s)</a>

                        <a class="btn btn-outline btn-danger" href="/deleteTemplate" role="button"> <i
                                class="fa fa-trash-o"></i> Delete Template(s)</a>

                        <a class="btn btn-outline btn-secondary" href="/clientInbox" role="button"> <i
                                class="fa fa-envelope-o"></i> View Inbox</a>

                        <a class="btn btn-outline btn-secondary" href="/clientSettings" role="button"> <i
                                class="fa fa-cog"></i> View Settings</a>
                    </p>

                </div>
            </div>


            <br>

            <div class="ibox-title">
                <h2>View Business Customers</h2>
            </div>

            <div class="ibox-content">
                <table class="footable table table-stripped toggle-arrow-tiny tablet breakpoint footable-loaded">
                    <thead>
                        <tr>

                            <th data-toggle="true" class="footable-visible footable-first-column footable-sortable">
                                Company<span class="footable-sort-indicator"></span></th>
                            <th class="footable-visible footable-sortable">Name<span
                                    class="footable-sort-indicator"></span></th>
                            <th data-type="numeric" class="footable-visible footable-sortable">Phone<span
                                    class="footable-sort-indicator"></span></th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($b_cust as $customer): ?>
                        <tr class="footable-even" style="">
                            <td class="footable-visible footable-first-column"><span
                                    class="footable-toggle"></span><?php echo $customer['companyName']; ?></td>
                            <td class="footable-visible"><?php echo $customer['contact']; ?></td>
                            <td class="footable-visible"><?php echo $customer['tel']; ?></td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="5" class="footable-visible">
                                <ul class="pagination float-right">
                                    <li class="footable-page-arrow disabled"><a data-page="first" href="#first">«</a>
                                    </li>
                                    <li class="footable-page-arrow disabled"><a data-page="prev" href="#prev">‹</a></li>
                                    <li class="footable-page active"><a data-page="0" href="#">1</a></li>
                                    <li class="footable-page"><a data-page="1" href="#">2</a></li>
                                    <li class="footable-page-arrow"><a data-page="next" href="#next">›</a></li>
                                    <li class="footable-page-arrow"><a data-page="last" href="#last">»</a></li>
                                </ul>
                            </td>
                        </tr>
                    </tfoot>
                </table>

            </div>
        </div>
    </div>
</div>

<a href="<?= base_url() ?>/LoginController/Logout" class="nav_link">
    <i class='bx bx-log-out nav_icon'></i>
    <span class="nav_name">SignOut</span>
</a>

<?= view('templates/footer'); ?>