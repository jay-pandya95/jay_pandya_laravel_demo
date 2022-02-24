@extends('layouts.master')
@section('content')  
    <div class="row">
		<div class="col-md-12">
			<h2>Import Product</h2>
		</div>
	</div><br>
    <div class="row">
		<div class="col-md-12">
			<form action="<?php echo url('product/csv_upload'); ?>" method="post" id="product_form" enctype="multipart/form-data">
                @csrf
				<div class="form-group">
					<label for="exampleInputEmail1">File</label>
					<input type="file" name="import_file" class="form-control">
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

