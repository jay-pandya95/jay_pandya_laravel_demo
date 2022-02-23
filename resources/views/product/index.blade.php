@extends('layouts.master')
@section('content') 
    <div class="row">
		<div class="col-md-12">
            <table id="shop_table" class="table table-striped">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Manage</th>
                    </tr>
                    <tbody>
                        <?php if(!empty($shops)) { ?>
                            <?php  foreach($shops as $shop) {?>
                                <tr>
                                    <td>{{$shop->id}}</td>
                                    <td>{{$shop->name}}</td>
                                    <td>{{$shop->email}}</td>
                                    <td><a href="{{url('/shop/setup/'.$shop->id)}}" class="btn btn-primary">Edit</a> <a href="{{url('/shop/delete/'.$shop->id)}}" onclick="return confirm('Are you sure you want to delete this shop?');" class="btn btn-danger">Delete</a></td>
                                </tr>
                            <?php } ?>
                        <?php } ?>
                    </tbody>
                </thead>
            </table>
		</div>
	</div> 
@stop 
@section('js_files')  
<script src="{{ url('/public/js/module/shop.js') }}"></script>
@stop

