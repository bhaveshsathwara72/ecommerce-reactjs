import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import Header from '../components/layout/Header';
import Footer from '../components/layout/Footer';
import CartService from '../services/CartService';
import { STORAGE_URL } from '../utils/constants';

const Cart = () => {
  const [cartItems, setCartItems] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchCartItems = async () => {
      try {
        const items = await CartService.getCartItems();
        setCartItems(Array.isArray(items) ? items : []);
      } catch (error) {
        console.error('Error fetching cart items:', error);
        setCartItems([]);
      } finally {
        setLoading(false);
      }
    };
    fetchCartItems();
  }, []);

  const updateQuantity = async (id, newQuantity) => {
    if (newQuantity < 1) return;
    try {
      await CartService.updateQuantity(id, newQuantity);
      setCartItems(cartItems.map(item => 
        item.id === id ? {...item, quantity: newQuantity} : item
      ));
    } catch (error) {
      console.error('Error updating quantity:', error);
    }
  };

  const removeItem = async (id) => {
    try {
      await CartService.removeFromCart(id);
      setCartItems(cartItems.filter(item => item.id !== id));
      window.location.href = '/cart';
    } catch (error) {
      console.error('Error removing item:', error);
    }
  };

  const handleCheckout = async () => {
    try {
      const orderItems = cartItems.map(item => ({
        product_id: item.product.id,
        quantity: item.quantity
      }));
      
      const response = await CartService.createOrder({ items: orderItems });
      // Handle successful order creation
      console.log('Order created:', response);
      // Optionally redirect to order confirmation page
      window.location.href = '/orders/' + response.id;
    } catch (error) {
      console.error('Order creation error:', error);
    }
  };

  const subtotal = Array.isArray(cartItems) 
    ? cartItems.reduce((sum, item) => sum + (item.product.price * item.quantity), 0)
    : 0;

  return (
    <div className="min-h-screen flex flex-col">
      <Header />
      
      <main className="flex-grow container mx-auto px-4 py-8">
        <h1 className="text-3xl font-bold mb-8">Shopping Cart</h1>
        
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {/* Cart Items */}
          <div className="lg:col-span-2">
            {cartItems.length === 0 ? (
              <div className="text-center py-12">
                <p className="text-xl mb-4">Your cart is empty</p>
                <Link 
                  to="/products" 
                  className="text-blue-600 hover:underline"
                >
                  Continue Shopping
                </Link>
              </div>
            ) : (
              <div className="bg-white rounded-lg shadow">
                {cartItems.map(item => (
                  <div key={item.id} className="p-4 border-b last:border-b-0 flex flex-col md:flex-row">
                    <div className="w-full md:w-1/4 mb-4 md:mb-0">
                      <img 
                              src={STORAGE_URL  +  item.product.image } 
                              alt={item.product.name}
                        className="w-full h-auto rounded"
                      />
                    </div>
                    <div className="flex-grow md:pl-6">
                      <div className="flex justify-between">
                        <h3 className="text-lg font-semibold">{item.product.name}</h3>
                        <button 
                          onClick={() => removeItem(item.id)}
                          className="text-red-500 hover:text-red-700"
                        >
                          Remove
                        </button>
                      </div>
                      <p className="text-gray-600 mb-2">{item.product.year} • {item.product.color}</p>
                      <p className="text-lg font-bold mb-4">${item.product.price.toLocaleString()}</p>
                      
                      <div className="flex items-center">
                        <button 
                          onClick={() => updateQuantity(item.id, item.quantity - 1)}
                          className="px-3 py-1 border rounded-l"
                        >
                          -
                        </button>
                        <span className="px-4 py-1 border-t border-b">{item.quantity}</span>
                        <button 
                          onClick={() => updateQuantity(item.id, item.quantity + 1)}
                          className="px-3 py-1 border rounded-r"
                        >
                          +
                        </button>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
          
          {/* Order Summary */}
          <div className="bg-white p-6 rounded-lg shadow">
            <h2 className="text-xl font-bold mb-4">Order Summary</h2>
            <div className="space-y-4 mb-6">
              <div className="flex justify-between">
                <span>Subtotal</span>
                <span>${subtotal.toLocaleString()}</span>
              </div>
              <div className="flex justify-between">
                <span>Shipping</span>
                <span>Free</span>
              </div>
              <div className="flex justify-between font-bold text-lg">
                <span>Total</span>
                <span>${subtotal.toLocaleString()}</span>
              </div>
            </div>
            
            <button 
              onClick={handleCheckout}
              className="w-full bg-blue-600 text-white py-3 rounded hover:bg-blue-700 transition-colors"
              disabled={cartItems.length === 0}
            >
              Proceed to Checkout
            </button>
            
            <Link 
              to="/products" 
              className="block text-center text-blue-600 hover:underline mt-4"
            >
              Continue Shopping
            </Link>
          </div>
        </div>
      </main>

      <Footer />
    </div>
  );
};

export default Cart;