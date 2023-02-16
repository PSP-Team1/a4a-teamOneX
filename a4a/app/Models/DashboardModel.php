<?php

namespace App\Models;

use CodeIgniter\Model;

class DashboardModel extends Model
{

    function getCompanies(){
        $db = db_connect();
        
        $sql = "select * from b_customers;";
        $results = $db->query($sql)->getResult('array');
        return $results;
    }

}