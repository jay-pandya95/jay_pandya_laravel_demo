@extends('layouts.master')
@section('content')  
    <div class="row">
		<div class="col-md-12">
			<h2>Add Shop</h2>
		</div>
	</div><br>
    <div class="row">
		<div class="col-md-12">
			<form action="<?php echo url('shop/commit'); ?>" method="post" id="shop_form" enctype="multipart/form-data">
                @csrf
                <input type="hidden" id="shop_id" name="shop_id" value="<?php echo (isset($shop_id) && $shop_id != "" ? $shop_id : '');?>">
				<div class="form-group">
					<label for="exampleInputEmail1">Name</label>
					<input type="name" class="form-control" name="name" placeholder="Name" value="<?php echo (isset($shop->name) ? $shop->name : '');?>">
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Email</label>
					<input type="email" name="email"  class="form-control email" placeholder="Email" value="<?php echo (isset($shop->email) ? $shop->email : '');?>">
					<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
				</div>
                <div class="form-group">
					<label for="exampleInputEmail1">Address</label>
					<textarea class="form-control" name="address"><?php echo (isset($shop->address) ? $shop->address : '');?></textarea>
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Image</label>
					<input type="file" name="avtar" class="form-control" placeholder="image">
				</div>
				<button type="submit" class="btn btn-primary">Save</button>
			</form>
		</div>
	</div>
@stop
@section('js_files')  
<script src="{{ url('/public/js/jquery.validate.js') }}"></script>
<script src="{{ url('/public/js/module/shop.js') }}"></script>
@stop

