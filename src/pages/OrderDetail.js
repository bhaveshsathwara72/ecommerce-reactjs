import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import Header from '../components/layout/Header';
import Footer from '../components/layout/Footer';
import OrderService from '../services/OrderService';
import { STORAGE_URL } from '../utils/constants';
import { Link } from 'react-router-dom';

const OrderDetail = () => {
  const { id } = useParams();
  const [order, setOrder] = useState(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchOrder = async () => {
      try {
        const data = await OrderService.getOrderDetails(id);
        setOrder(data);
      } catch (error) {
        console.error('Error fetching order:', error);
      } finally {
        setLoading(false);
      }
    };
    fetchOrder();
  }, [id]);

  if (loading) {
    return <div className="text-center py-12">Loading...</div>;
  }

  if (!order) {
    return (
      <div className="text-center py-12">
        <p>Order not found</p>
        <Link to="/orders" className="text-blue-600 hover:underline">
          Back to Orders
        </Link>
      </div>
    );
  }

  return (
    <div className="min-h-screen flex flex-col">
      <Header />
      
      <main className="flex-grow container mx-auto px-4 py-8">
        <div className="max-w-4xl mx-auto">
          <div className="flex justify-between items-center mb-6">
            <h1 className="text-2xl font-bold">Order #{order.id}</h1>
            <span className={`px-3 py-1 rounded-full text-sm font-medium ${
              order.status === 'completed' ? 'bg-green-100 text-green-800' :
              order.status === 'cancelled' ? 'bg-red-100 text-red-800' :
              'bg-blue-100 text-blue-800'
            }`}>
              {order.status}
            </span>
          </div>

          <div className="bg-white rounded-lg shadow p-6 mb-6">
            <h2 className="text-xl font-semibold mb-4">Order Details</h2>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
              <div>
                <h3 className="font-medium text-gray-600 mb-2">Order Date</h3>
                <p>{new Date(order.created_at).toLocaleDateString()}</p>
              </div>
              <div>
                <h3 className="font-medium text-gray-600 mb-2">Total Amount</h3>
                <p className="font-bold">${order.total_amount.toLocaleString()}</p>
              </div>
            </div>

            <h3 className="font-medium text-gray-600 mb-2">Items</h3>
            <div className="divide-y divide-gray-200">
              {order.items.map(item => (
                <div key={item.id} className="py-4 flex">
                  <div className="w-1/6">
                    <img 
                      src={STORAGE_URL + item.product.image} 
                      alt={item.product.name}
                      className="w-full h-auto rounded"
                    />
                  </div>
                  <div className="ml-4 flex-grow">
                    <h4 className="font-medium">{item.product.name}</h4>
                    <p className="text-gray-600">Quantity: {item.quantity}</p>
                    <p className="text-gray-600">Price: ${item.price.toLocaleString()}</p>
                    <p className="font-medium">
                      Subtotal: ${(item.price * item.quantity).toLocaleString()}
                    </p>
                  </div>
                </div>
              ))}
            </div>
          </div>

          <div className="bg-white rounded-lg shadow p-6">
            <h2 className="text-xl font-semibold mb-4">Shipping Information</h2>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
              <div>
                <h3 className="font-medium text-gray-600 mb-2">Shipping Address</h3>
                <p>{order.shipping_address?.address_line1 || 'N/A'}</p>
                <p>{order.shipping_address?.city}, {order.shipping_address?.state}</p>
                <p>{order.shipping_address?.country}, {order.shipping_address?.postal_code}</p>
              </div>
              <div>
                <h3 className="font-medium text-gray-600 mb-2">Payment Method</h3>
                <p>{order.payment_method || 'N/A'}</p>
              </div>
            </div>
          </div>
        </div>
      </main>

      <Footer />
    </div>
  );
};

export default OrderDetail;