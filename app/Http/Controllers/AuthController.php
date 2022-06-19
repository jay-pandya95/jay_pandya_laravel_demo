<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;

class AuthController extends Controller
{
    function __construct() {
    
    }
    public function index(Request $request) {

        if(Auth::guard('web')->check()) {
            return redirect('/shop');
        } else {
            return view('auth.login');
        }

    }

    public function login(Request $request) {
        if($request->method() == "POST") {

            $this->validate($request, [
                'email'   => 'required|email',
                'password' => 'required|min:6'
            ]);

            if (Auth::guard('web')->attempt(['email' => $request->email, 'password' => $request->password])) {

                // Auth::guard('web')->user();
                return redirect('/dashboard');
            } else{
                return redirect()->back();
            }
        } else {
            return redirect('/');
        }
        
    }
    public function home(Request $request) {
        return redirect('/');
    }
    public function logout(Request $request) {
        Auth::guard('web')->logout();
        return redirect('/');
    }


    
}
