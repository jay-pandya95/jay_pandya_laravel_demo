<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\Product;
use App\Models\Shop;
use Excel;

class ProductController extends Controller
{
    function __construct() {
        
    }
    public function index(Request $request) {
        if($request->method() == "POST") {
            $min_price = $request->min_price;
            $max_price = $request->max_price;
            $stock = $request->stock;
            $search = $request->search;
            $draw = $request->draw;
            $order = $request->order;
            $start = $request->start;
            $length = $request->length;
            $colume = array(
                            '0' => 'products.id', 
                            '1' => 'products.name', 
                            '2' => 'shops.name', 
                            '3' => 'price', 
                            '4' => 'stock', 
                        );

        $producs =  Product::select(['products.*','shops.name as shop_name']);
        $producs->leftJoin('shops', 'shops.id', '=', 'products.shop_id');

        if($stock != '') {
            $producs->where('prize','=',$stock);
        }
        if($min_price != '' && $max_price != '') {
            $producs->where('prize','>=',$min_price);
            $producs->where('prize','<=',$max_price);
        }

        
        if(!empty($order)) {
            $order_field =  $colume[$order[0]['column']];
            $order_value = $order[0]['dir'];
            $producs->orderBy($order_field,$order_value);
        }

        $total_count =  $producs->count();

        if($search['value'] != "") {
            $search = $search['value'];
            $producs->where(function($query) use ($search){
                $query->where('products.id', 'LIKE', '%'.$search.'%')
                      ->orWhere('products.name', 'LIKE', '%'.$search.'%')
                      ->orWhere('shops.name', 'LIKE', '%'.$search.'%')
                      ->orWhere('price', 'LIKE', '%'.$search.'%')
                      ->orWhere('stock', 'LIKE', '%'.$search.'%');
            });
        }

         $filter_count = $producs->skip($start)->take($length)->count();          
         $record = $producs->skip($start)->take($length)->get();          
               
         $data = array();

         foreach ($record as $key => $value) {
             $row = array();
             $row['product_id'] = $value->id;
             $row['name'] = $value->name;
             $row['shop'] = $value->shop_name;
             $row['price'] = $value->price;
             $row['stock'] = $value->stock;
             $row['manage'] = 'fsdf';
             $data[]  = $row;
         }
          
         
         $response = array(
            "draw" => intval($draw),
            "iTotalRecords" => $total_count,
            "iTotalDisplayRecords" => $filter_count,
            "aaData" => $data
         );

        echo json_encode($response);

        } else {
            return view('product.index');
        }
    }

    public function setup(Request $request) {
        $id = $request->id;

        if($id != "") {
            $product = Product::where('id',$id)->first();

            $data['product'] = $product;
        }
        
        $shops = Shop::get();
        $data['shops'] = $shops;
        $data['product_id'] = $id;
 
        return view('product.form',$data);
    }

    public function commit(Request $request) {
        if($request->method() == "POST") {
            $this->validate($request, [
                'name'      => 'required',
                'shop_id'      => 'required',
                'price'     => 'required',
                'stock'     => 'required',
            ]);

            $id = $request->product_id;

            $p_data['name']     = $request->name;
            $p_data['shop_id']  = $request->shop_id;
            $p_data['price']    = $request->price;
            $p_data['stock']    = $request->stock;

            if($id != '') {
                $update =  Product::where('id',$id)->update($p_data);
            } else {
               $insert =  Product::create($p_data);
               $id  = $insert->id;
            }   

            $file = $request->file('video');

            if(!empty($file)) {
                $filename = 'video-' . time() . '.' . $file->getClientOriginalExtension();
                $path = $file->storeAs('public/products', $filename);

                $p_image['video']   = $path;
                Product::where('id',$id)->update($p_image);

            }
            return redirect('/product');

        } else {
            return redirect('/');
        }
    }
    public function delete(Request $request) {
        $id = $request->id;

        $product = Product::where('id',$id)->first();

        if(!empty($product)) {
            $delete = Product::where('id',$id)->delete();

            if($delete) {
                return redirect('/product');
            }
        } else {
            return redirect('/product');
        }
    }

    public function duplicate(Request $request) {
        $shop_id = $request->shop_id;
        $name = $request->name;
        $id = $request->product_id;

        if($id != "") {
            $data = Product::where('id','!=',$id)->where('shop_id',$shop_id)->where('name',$name)->first();
        } else {
            $data = Product::where('shop_id',$shop_id)->where('name',$name)->first();
        }

        if(!empty($data)) {
            echo 'false';
        } else {
            echo  'true';
        }
    }

    public function csv_export() {

        $products    = Product::select(['products.*','shops.name as shop_name']);
        $products->leftJoin('shops', 'shops.id', '=', 'products.shop_id');

        $record =  $products->get();

        $filename = "product_csv.csv";
        $fp = fopen('php://output', 'w');
        header('Content-type: application/csv');
        header('Content-Disposition: attachment; filename='.$filename);

        fputcsv($fp, array('id','name','shop name','price','stock'));

        if(!empty($record)) {
            foreach ($record as $key => $value) {
                fputcsv($fp, array($value->id,$value->name,$value->shop_name,$value->price,$value->stock));
            }
        }
        exit;
    }
    public function upload_csv(Request $request) {
    
        return view('product.upload_csv');
    }

    public function csv_upload(Request $request) {
        if($request->hasFile('import_file')){
            Excel::load($request->file('import_file')->getRealPath(), function ($reader) {
                foreach ($reader->toArray() as $key => $row) {

                }
            });
        }

        Session::put('success', 'Youe file successfully import in database!!!');

        return back();

    }
}
