<?php

namespace App\Controllers;

// use App\Models\DashboardModel;


class ClientDashboard extends BaseController
{
    public function index()
    {

        // $appModel = new DashboardModel();
        // $data['companies'] = $appModel->getCompanies();

        return view('ClientDash');
    }
}
