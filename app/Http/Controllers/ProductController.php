<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\Product;

class ProductController extends Controller
{
    function __construct() {
    
    }
    public function index(Request $request) {
        $products = Product::get();
        $data['products'] = $products;

        return view('product.index',$data);
    }
    
}
