<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Cart;
use App\Models\Product;
use App\Models\OrderItem;
use Illuminate\Http\Request;

class OrderController extends Controller
{
    public function store(Request $request)
    {
        $validated = $request->validate([
            'items' => 'required|array',
            'items.*.product_id' => 'required|exists:products,id',
            'items.*.quantity' => 'required|integer|min:1'
        ]);

        $total = 0;
        foreach ($validated['items'] as $item) {
            $product = Product::find($item['product_id']);
            $total += $product->price * $item['quantity'];
        }

        $order = Order::create([
            'user_id' => auth()->id(),
            'total_amount' => $total,
            'status' => 'pending'
        ]);

        foreach ($validated['items'] as $item) {
            $product = Product::find($item['product_id']);
            OrderItem::create([
                'order_id' => $order->id,
                'product_id' => $item['product_id'],
                'quantity' => $item['quantity'],
                'price' => $product->price
            ]);
        }
        auth()->user()->cartItems()->delete();
        return response()->json($order->load('items.product'));
    }

    public function index()
    {
        return auth()->user()->orders()->with('items.product')->get();
    }

    public function show(Order $order)
    {
        return $order->load('items.product');
    }

    public function all(){
        return Order::with(['user', 'items.product'])->get();
    }
    

    public function updateStatus(Request $request, $orderId)
    {
        $validated = $request->validate([
            'status' => 'required|in:pending,processing,completed,cancelled'
        ]);
    
        $order = Order::findOrFail($orderId);
        $order->status = $validated['status'];
        $order->save();
    
        return response()->json($order);
    }
}