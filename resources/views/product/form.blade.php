@extends('layouts.master')
@section('content')  
    <div class="row">
		<div class="col-md-12">
			<h2>Add Product</h2>
		</div>
	</div><br>
    <div class="row">
		<div class="col-md-12">
			<form action="<?php echo url('product/commit'); ?>" method="post" id="product_form" enctype="multipart/form-data">
                @csrf
                <input type="hidden" class="product_id" name="product_id" value="<?php echo (isset($product_id) && $product_id != "" ? $product_id : '');?>">
				<div class="form-group">
					<label for="exampleInputEmail1">Name</label>
					<input type="text" class="form-control name" id="name" name="name" placeholder="Name" value="">
				</div>
				<div class="form-group">
					<label>Shop</label>
					<select name="shop_id" class="form-control shop_id">
						<option value="">-select shop-</option>
						<?php foreach($shops as $shop) { ?>
							<option value="{{$shop->id}}">{{$shop->name}}</option>
						<?php } ?>
					</select>
				</div>
                <div class="form-group">
					<label for="exampleInputEmail1">Stock</label>
					<input type="text" class="form-control" name="stock" value="">
				</div>
                <div class="form-group">
					<label for="exampleInputEmail1">Price</label>
					<input type="text" class="form-control" name="price" value="">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Video</label>
					<input type="file" name="video" class="form-control">
				</div>
				<button type="submit" class="btn btn-primary">Save</button>
			</form>
		</div>
	</div>
@stop
@section('js_files')  
<script src="{{ url('/public/js/jquery.validate.js') }}"></script>
<script src="{{ url('/public/js/module/product.js') }}"></script>
@stop

