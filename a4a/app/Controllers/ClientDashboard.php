<?php

namespace App\Controllers;

use App\Models\DashboardModel;


class ClientDashboard extends BaseController
{
    public function index()
    {

        $dm = new DashboardModel();

        $data['b_cust'] = $dm->getCustomers();
        
        return view('ClientDash', $data);
    }
}