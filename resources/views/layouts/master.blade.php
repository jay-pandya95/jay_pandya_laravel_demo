<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Laravel</title>

        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="{{ url('/public/css/bootstrap.min.css') }}">
        <link rel="stylesheet" href="{{ url('/public/css/bootstrap.min.css') }}">
        <link rel="stylesheet" href="{{ url('/public/css/font-awesome.min.css') }}">
        <style>
           .error {
               color: red;
           }
        </style>
        <script>
            var token = "<?php echo csrf_token(); ?>"
            var url = "<?php echo url(''); ?>"

        </script>
    </head>
    <body>
        <div>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="{{url('/shop')}}">Shop</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{url('/product')}}">Product</a>
            </li>
            
            </ul>
        </div>
        </nav>
        <div>
        <div class="container">  
            @yield('content')  
        </div>  

        <script src="{{ url('/public/js/jquery-3.6.0.min.js') }}"></script>
        <script src="{{ url('/public/js/bootstrap.min.js') }}"></script>
        <script src="{{ url('/public/js/datatables.min.js') }}"></script>
        @yield('js_files')
    </body>
</html>
