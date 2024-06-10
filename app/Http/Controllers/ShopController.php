<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

// class ShopController extends Controller
// {
//     public function view(Request $request)
//     {
//         $products = DB::table('PRODUK')->paginate(8);
//         // Mengirimkan data produk ke view shop-4-column
//         return view("shop-4-column", compact('products'));
//     }
// }


// namespace App\Http\Controllers;

// use Illuminate\Http\Request;
// use App\Models\Product;

class ShopController extends Controller
{
    public function view(Request $request)
    {
        // Ambil nomor halaman dari query string, atau default ke 1
        $pageNumber = $request->query('page', 1);

        // Ambil data produk dari database dengan pagination
        $products = DB::table('PRODUK')->paginate(8, ['*'], 'page', $pageNumber); // Ganti 10 dengan jumlah item per halaman yang diinginkan

        // Kembalikan view dengan data produk
        return view('shop-4-column', ['products' => $products]);
    }

    public function showCategory($animal, $category = null)
    {
        // Mengambil kategori berdasarkan hewan
        $categories = DB::table('CATEGORY')
            ->where('CATEGORY_ANIMAL', $animal)
            ->where('STATUS_DEL', 0)
            ->get();

        // Mengambil produk berdasarkan kategori jika kategori dipilih
        if ($category) {
            $products = DB::table('PRODUK')
                ->join('CATEGORY', 'PRODUK.CATEGORY_ID', '=', 'CATEGORY.CATEGORY_ID')
                ->where('CATEGORY.CATEGORY_ANIMAL', $animal)
                ->where('CATEGORY.CATEGORY_NAME', $category)
                ->where('PRODUK.STATUS_DEL', 0)
                ->select('PRODUK.*')
                ->get();
        } else {
            $products = DB::table('PRODUK')
                ->join('CATEGORY', 'PRODUK.CATEGORY_ID', '=', 'CATEGORY.CATEGORY_ID')
                ->where('CATEGORY.CATEGORY_ANIMAL', $animal)
                ->where('PRODUK.STATUS_DEL', 0)
                ->select('PRODUK.*')
                ->get();
        }

        return view('shop', compact('animal', 'category', 'categories', 'products'));
    }
}
