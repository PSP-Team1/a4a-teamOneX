<?php

namespace App\Controllers;
use App\Models\AdminModel;

class AdminSettingsController extends BaseController
{
    public function index()
    {
        return view('AdminSettings');
    }

    public function changeDetails()
    {
        return view('AdminChangeDetails');
    }

    public function updateDetails()
    {
        $id = $this->request->getPost('id');
        $name = $this->request->getPost('name');
        $email = $this->request->getPost('email');

        $adminModel = new AdminModel();
        $adminModel->updateUser($id, $name, $email);

        return redirect()->to('AdminSettings');

    }
}