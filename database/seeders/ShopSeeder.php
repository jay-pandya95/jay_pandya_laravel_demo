<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class ShopSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i=0; $i <= 100; $i++) { 
	    	\App\Models\Shop::create([
	            'name'      => 'abc',
	            'email'     => 'abc'.$i.'@mail.com',
	            'address'   => 'dummy address',
	            'image'     => 'head-659652_1280.png',
	        ]);
    	}  
        //
    }
}
