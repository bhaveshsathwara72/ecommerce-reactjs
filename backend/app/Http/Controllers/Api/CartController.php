<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use Illuminate\Http\Request;

class CartController extends Controller
{
    public function index()
    {
        return Cart::with('product')->where('user_id', auth()->id())->get();
    }

    public function store(Request $request)
    {
        if (!auth()->check()) {
            return response()->json(['message' => 'Unauthorized'], 401);
        }
    
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'quantity' => 'required|integer|min:1'
        ]);

        $cartItem = Cart::updateOrCreate(
            [
                'user_id' => auth()->id(),
                'product_id' => $request->product_id
            ],
            ['quantity' => $request->quantity]
        );

        return response()->json($cartItem, 201);
    }

    public function update(Request $request, Cart $cart)
    {

        $request->validate([
            'quantity' => 'required|integer|min:1'
        ]);

        $cart->update(['quantity' => $request->quantity]);

        return response()->json($cart);
    }

    public function destroy(Cart $cart)
    {
        $cart->delete();
        return response()->json(null, 204);
    }
}
