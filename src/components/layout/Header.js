import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import OrderService from '../../services/OrderService';
import CartService from '../../services/CartService';

const Header = () => {
  const { isAuthenticated, currentUser, logout } = useAuth();
  const [orderCount, setOrderCount] = useState(0);
  const [cartCount, setCartCount] = useState(0);

  useEffect(() => {
    const fetchOrderCount = async () => {
      if (currentUser) {
        try {
          const orders = await OrderService.getOrders();
          setOrderCount(orders.length);
          const carts = await CartService.getCartItems();
          setCartCount(carts.length);
        } catch (error) {
          console.error('Error fetching orders:', error);
        }
      }
    };
    fetchOrderCount();
  }, [currentUser]);

  return (
    <header className="bg-white shadow-sm">
      <div className="container mx-auto px-4 py-4 flex justify-between items-center">
        <Link to="/" className="text-xl font-bold">
          Car Crafters
        </Link>
        
        <nav className="flex items-center space-x-6">
          <Link to="/products" className="hover:text-blue-600">
            Products
          </Link>
          <Link to="/categories" className="hover:text-blue-600">
            Categories
          </Link>
          <Link to="/cart" className="hover:text-blue-600 relative">
            Cart
            {cartCount > 0 && (
              <span className="absolute -top-2 -right-2 bg-red-500 text-white text-xs rounded-full h-5 w-5 flex items-center justify-center">
                {cartCount}
              </span>
            )}
          </Link>
          <Link to="/orders" className="hover:text-blue-600 relative">
            Orders
            {orderCount > 0 && (
              <span className="absolute -top-2 -right-2 bg-red-500 text-white text-xs rounded-full h-5 w-5 flex items-center justify-center">
                {orderCount}
              </span>
            )}
          </Link>
          {isAuthenticated ? (
            <div className="flex items-center space-x-4">
              <span>Welcome, </span>
              <Link to="/profile" className="text-blue-600 hover:text-blue-800">
              {currentUser?.name || currentUser?.email || 'User'}
              </Link>
              <button 
                onClick={logout}
                className="text-blue-600 hover:text-blue-800"
              >
                Logout
              </button>
            </div>
            ) : (
            <Link to="/login" className="text-blue-600 hover:text-blue-800">
              Login
            </Link>
          )}
        </nav>
      </div>
     
    </header>
  );
};

export default Header;