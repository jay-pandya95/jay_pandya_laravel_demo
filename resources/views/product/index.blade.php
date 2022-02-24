@extends('layouts.master')
@section('content')
    <div class="row">
		<div class="col-md-6">
			<h2>Manage Product</h2>
		</div>
        <div class="col-md-3">
			<a class="btn btn-primary" href="{{url('/product/csv_export')}}">Export CSV</a>
		</div>
        <div class="col-md-3">
			<a class="btn btn-success" href="{{url('/product/upload_csv')}}">Import CSV</a>
		</div>
	</div><br>
    <div class="row">
        <div class="col-md-3">
            <input type="text" class="form-control min_price" id="min_price" name="name" placeholder="Min Price" value="">
        </div>
        <div class="col-md-3">
            <input type="text" class="form-control max_price" id="max_price" name="name" placeholder="Max Price" value="">
        </div>
        <div class="col-md-4">
            <input type="text" class="form-control stock" id="stock" name="name" placeholder="Stock" value="">
        </div>
        <div class="col-md-1">
            <button class="btn btn-primary search">Search</button>
        </div>
        <div class="col-md-1">
            <button class="btn btn-danger reset">Reset</button>
        </div>
	</div><br>
    <div class="row">
		<div class="col-md-12">
            <table  class="table table-striped product_table" id="product_table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Name</th>
                        <th>shop</th>
                        <th>price</th>
                        <th>stock</th>
                        <th>stock</th>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
                <tfoot>
                    <tr>
                        <th>No</th>
                        <th>Name</th>
                        <th>shop</th>
                        <th>price</th>
                        <th>stock</th>
                        <th>stock</th>
                    </tr>
                </tfoot>
            </table>
		</div>
	</div> 
@stop 
@section('js_files')  
<script src="{{ url('/public/js/module/product.js') }}"></script>
@stop

