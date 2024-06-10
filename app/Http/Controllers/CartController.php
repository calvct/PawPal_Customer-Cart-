<?php

namespace App\Http\Controllers;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

use function Laravel\Prompts\alert;

class CartController extends Controller
{
    public function view()
    {
        $userId = Cookie::get('user');

        // Jika tidak ada di cookie, ambil dari session
        if (!$userId) {
            $user = Session::get('user');

            // Jika tidak ada user di session, redirect ke halaman login atau lakukan tindakan lain


            $userId = $user->USER_ID;
        }


        $userCart = CartController::getUserCart($userId);

        return view("cart",["datacart" => $userCart]);
    }
    public function getUserCart(string $id){
        // $userid = DB::table('CART')
        // ->join('PRODUK','PRODUK.PRODUCT_ID','=','CART.PRODUCT_ID')
        // ->select('CART.PRODUCT_ID','PRODUK.PRODUCT_NAME','PRODUK.PRODUCT_PRICE','CART.CART_QTY','CART.CART_QTY * PRODUK.PRODUCT_PRICE AS SUBTOTAL')
        // ->where('CART.USER_ID','=',$id);
        // return $userid;
        $userCart = DB::table('CART')
        ->join('PRODUK','PRODUK.PRODUCT_ID','=','CART.PRODUCT_ID')
        ->select('CART.PRODUCT_ID','PRODUK.PRODUCT_NAME','PRODUK.PRODUCT_PRICE','CART.CART_QTY',DB::raw('CART.CART_QTY * PRODUK.PRODUCT_PRICE AS SUBTOTAL'))
        ->where('CART.USER_ID','=',$id)
        ->where('CART.STATUS_DEL', '=',0)
        ->get(); // Execute the query and get results

    foreach ($userCart as $item) {
        $productId = $item->PRODUCT_ID; // Access PRODUCT_ID from each item
        // Use $productId and other properties from $item
    }

    return $userCart;
    }
    public function updateCart(Request $request)
    {
    $products = $request->input('products');
    $userId = Cookie::get('user');

    // Jika tidak ada di cookie, ambil dari session
    if (!$userId) {
        $user = Session::get('user');

        // Jika tidak ada user di session, redirect ke halaman login atau lakukan tindakan lain


        $userId = $user->USER_ID;
    }
    // Update the Cart column in the database
    foreach ($products as $product) {
        DB::table('CART')
        ->where('USER_ID',$userId)
        ->where('PRODUCT_ID',$product['productId'])
        ->update(['CART_QTY' => $product['newQty']]);
    }
    return response()->json(['success' => true]);
}
}