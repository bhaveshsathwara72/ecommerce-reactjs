import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import Header from '../components/layout/Header';
import Footer from '../components/layout/Footer';
import OrderService from '../services/OrderService';
import { STORAGE_URL } from '../utils/constants';

const Order = () => {
  const [orders, setOrders] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchOrders = async () => {
      try {
        const data = await OrderService.getOrders();
        setOrders(data);
      } catch (error) {
        console.error('Error fetching orders:', error);
      } finally {
        setLoading(false);
      }
    };
    fetchOrders();
  }, []);

  return (
    <div className="min-h-screen flex flex-col">
      <Header />
      
      <main className="flex-grow container mx-auto px-4 py-8">
        <h1 className="text-3xl font-bold mb-8">My Orders</h1>
        
        {loading ? (
          <div className="text-center">Loading...</div>
        ) : (
          <div className="bg-white rounded-lg shadow overflow-hidden">
            {orders.length === 0 ? (
              <div className="text-center py-12">
                <p className="text-xl mb-4">You haven't placed any orders yet</p>
                <Link 
                  to="/products" 
                  className="text-blue-600 hover:underline"
                >
                  Browse Products
                </Link>
              </div>
            ) : (
              <div className="divide-y divide-gray-200">
                {orders.map(order => (
                  <div key={order.id} className="p-6">
                    <div className="flex justify-between items-start mb-4">
                      <div>
                        <h3 className="text-lg font-semibold">Order #{order.id}</h3>
                        <p className="text-gray-600">Placed on {new Date(order.created_at).toLocaleDateString()}</p>
                      </div>
                      <span className={`px-3 py-1 rounded-full text-sm font-medium ${
                        order.status === 'completed' ? 'bg-green-100 text-green-800' :
                        order.status === 'cancelled' ? 'bg-red-100 text-red-800' :
                        'bg-blue-100 text-blue-800'
                      }`}>
                        {order.status}
                      </span>
                    </div>
                    
                    <div className="space-y-4 mb-4">
                      {order.items.map(item => (
                        <div key={item.id} className="flex">
                          <div className="w-1/6">
                            <img 
                              src={ STORAGE_URL + item.product.image} 
                              alt={item.product.name}
                              className="w-full h-auto rounded"
                            />
                          </div>
                          <div className="ml-4 flex-grow">
                            <h4 className="font-medium">{item.product.name}</h4>
                            <p className="text-gray-600">Qty: {item.quantity}</p>
                            <p className="text-gray-600">${item.price.toLocaleString()}</p>
                          </div>
                        </div>
                      ))}
                    </div>
                    
                    <div className="flex justify-between items-center border-t border-gray-200 pt-4">
                      <p className="font-medium">Total: ${order.total_amount.toLocaleString()}</p>
                      <Link 
                        to={`/orders/${order.id}`}
                        className="text-blue-600 hover:underline"
                      >
                        View Details
                      </Link>
                    </div>
                  </div>
                ))}
              </div>
            )}
          </div>
        )}
      </main>

      <Footer />
    </div>
  );
};

export default Order;