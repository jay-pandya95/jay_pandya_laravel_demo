<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\Shop;

class ShopController extends Controller
{
    function __construct() {
    
    }
    public function index(Request $request) {
        $shops = Shop::get();
        $data['shops'] = $shops;

        return view('shop.index',$data);
    }
    public function setup(Request $request) {
        $id = $request->id;

        if($id != "") {
            $shop = Shop::where('id',$id)->first();

            $data['shop'] = $shop;
        }

        $data['shop_id'] = $id;
 
        return view('shop.form',$data);
    }
    public function commit(Request $request) {
        if($request->method() == "POST") {
            $this->validate($request, [
                'name'      => 'required',
                'email'     => 'required|email',
                'address'   => 'required',
            ]);

            $id = $request->shop_id;

            $s_data['name']     = $request->name;
            $s_data['email']    = $request->email;
            $s_data['address']  = $request->address;

            if($id != '') {
                $update =  Shop::where('id',$id)->update($s_data);
            } else {
               $insert =  Shop::create($s_data);
               $id  = $insert->id;
            }   

            $file = $request->file('avtar');

            if(!empty($file)) {
                $filename = 'photo-' . time() . '.' . $file->getClientOriginalExtension();
                $path = $file->storeAs('public/shops', $filename);

                $s_image['image']   = $path;
                Shop::where('id',$id)->update($s_image);

            }
            return redirect('/shop');

        } else {
            return redirect('/');
        }
    }
    public function delete(Request $request) {
        $id = $request->id;

        $shop = Shop::where('id',$id)->first();

        if(!empty($shop)) {
            $delete = Shop::where('id',$id)->delete();

            if($delete) {
                return redirect('/shop');
            }
        } else {
            return redirect('/shop');
        }

    }
    public function duplicate(Request $request) {
        $id = $request->shop_id;
        $email = $request->email;

        if($id != "") {
            $data = Shop::where('id','!=',$id)->where('email',$email)->first();
        } else {
            $data = Shop::where('email',$email)->first();
        }

        if(!empty($data)) {
            echo 'false';
        } else {
            echo  'true';
        }
    }


}
