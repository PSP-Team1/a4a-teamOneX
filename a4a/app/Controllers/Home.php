<?php

namespace App\Controllers;

class Home extends BaseController
{

    public function index()
    {
        $session = session();
        $data['user'] = $session->get('name');
        return view('home', $data);
    }
}
