<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <meta name="robots" content="/, follow" />
    <title>PawPal</title>
    <meta name="description" content="Jesco - Fashoin eCommerce HTML Template" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Add site Favicon -->
    <link rel="shortcut icon" href="{{asset('images/favicon/favicon.ico')}}" type="image/png">

    <!-- vendor css (Icon Font) -->
    <link rel="stylesheet" href="{{asset('css/vendor/bootstrap.bundle.min.css')}}" />
    <link rel="stylesheet" href="{{asset('css/vendor/pe-icon-7-stroke.css')}}" />
    <link rel="stylesheet" href="{{asset('/css/vendor/font.awesome.css')}}" />

    <!-- plugins css (All Plugins Files) -->
    <link rel="stylesheet" href="{{asset('/css/plugins/animate.css')}}" />
    <link rel="stylesheet" href="{{asset('/css/plugins/swiper-bundle.min.css')}}" />
    <link rel="stylesheet" href="{{asset('/css/plugins/jquery-ui.min.css')}}" />
    <link rel="stylesheet" href="{{asset('/css/plugins/nice-select.css')}}" />
    <link rel="stylesheet" href="{{asset('/css/plugins/venobox.css')}}" />
    <link rel="stylesheet" href="{{asset('/css/style.css')}}" />

    <style>
        .pagination {
            display: flex;
            justify-content: center;
            padding: 20px 0;
        }

        .pagination .page-item .page-link {
            border: 1px solid #ddd;
            padding: 10px 15px;
            margin: 0 5px;
            color: #333;
            text-decoration: none;
        }

        .pagination .page-item.active .page-link {
            background-color: #333;
            color: #fff;
        }

    </style>

</head>

<body>

    @extends('app')

    @section('title', 'Shop')

    @section('content')

    <!-- OffCanvas Menu Start -->
    <!-- Your OffCanvas menu HTML here -->
    <!-- OffCanvas Menu End -->

    <!-- Shop Page Start  -->
    <div class="shop-category-area pt-5 pb-100px">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Shop Top Area Start -->
                    <div class="shop-top-bar d-flex">
                        <!-- Left Side start -->
                        <p><span>{{ $products->count() }}</span> Product Found of <span>total</span></p>
                    </div>

                    <div class="shop-bottom-area">

                        <!-- Tab Content Area Start -->
                        <div class="row">
                            <div class="col">
                                <div class="tab-content">
                                    <div class="tab-pane fade show active" id="shop-grid">
                                        <div class="row mb-n-30px">
                                            {{-- Foreach disini --}}
                                            @foreach ($products as $product)
                                                <div class="col-lg-3 col-md-4 col-sm-6 col-xs-6 mb-30px" data-aos="fade-up"
                                                data-aos-delay="200">
                                                <!-- Single Prodect -->
                                                <div class="product">
                                                    <div class="thumb">
                                                        <a href="product-detail-{{ $product->PRODUCT_ID }}" class="image">
                                                            <img src="{{ asset('storage/' . $product->PRODUCT_ID . '.jpeg') }}" alt="Product" />
                                                            <img class="hover-image" src="{{ asset('storage/' . $product->PRODUCT_ID . '.jpeg') }}" alt="Product" />
                                                        </a>

                                                        
                                                        <div class="actions">
                                                            <a href="wishlist" class="action wishlist"
                                                                title="Wishlist"><i class="pe-7s-like"></i></a>
                                                        </div>
                                                        <a href="cart"><a href="cart"><a href="cart"><button title="Add To Cart" class=" add-to-cart">Add
                                                            To Cart</button>
                                                    </div>
                                                    <div class="content">
                                                        <h5 class="title"><a href="product-detail-{{ $product->PRODUCT_ID }}">{{ $product -> PRODUCT_NAME }}
                                                            </a>
                                                        </h5>
                                                        <span class="price">
                                                            <span class="new">Rp{{ number_format($product->PRODUCT_PRICE, 0, ',', '.') }}
                                                            </span>
                                                        </span>
                                                    </div>
                                                </div>
                                                </div>
                                            @endforeach
                                            <!-- Pagination -->
                                            {{-- <div class="pagination-area mt-4">
                                                <ul class="page-pagination">
                                                    {{ $products->links('vendor.pagination.default') }}
                                                </ul>
                                            </div> --}}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    {{-- <div class="shop-category-area pt-5 pb-100px">
        <div class="container">
            <div class="text-center mb-4">
                <p>Products for {{ ucfirst($animal) }} @if($category) > {{ ucfirst($category) }} @endif</p>
            </div>
            <div class="row">
                @foreach($products as $product)
                <div class="product-item">
                    <img src="{{ asset('storage/p0001.jpeg') }}" alt="{{ $product->PRODUCT_NAME }}">
                    <h2>{{ $product->PRODUCT_NAME }}</h2>
                    <p>Price: {{ $product->PRODUCT_PRICE }}</p>
                    <button class="add-to-cart-btn">ADD TO CART</button>
                </div>
                @endforeach
            </div>
        </div>
    </div> --}}
    @endsection
</body>

</html>
