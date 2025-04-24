import React, { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import OrderService from '../../services/OrderService';
import { STORAGE_URL } from '../../utils/constants';

const AdminOrderDetail = () => {
  const { id } = useParams();
  const [order, setOrder] = useState(null);
  const [loading, setLoading] = useState(true);
  const [status, setStatus] = useState('');

  useEffect(() => {
    const fetchOrder = async () => {
      try {
        const data = await OrderService.getOrderDetails(id);
        setOrder(data);
        setStatus(data.status);
      } catch (error) {
        console.error('Error fetching order:', error);
      } finally {
        setLoading(false);
      }
    };
    fetchOrder();
  }, [id]);

  const handleStatusChange = async (e) => {
    const newStatus = e.target.value;
    try {
      await OrderService.updateOrderStatus(id, { status: newStatus });
      setStatus(newStatus);
      setOrder({ ...order, status: newStatus });
    } catch (error) {
      console.error('Error updating order status:', error);
    }
  };

  if (loading) {
    return <div className="text-center py-12">Loading order details...</div>;
  }

  if (!order) {
    return (
      <div className="text-center py-12">
        <p>Order not found</p>
        <Link to="/admin/orders" className="text-blue-600 hover:underline">
          Back to Orders
        </Link>
      </div>
    );
  }

  return (
    <div className="min-h-screen flex flex-col">
      <div className="container mx-auto px-4 py-8">
        <div className="flex justify-between items-center mb-6">
          <h1 className="text-2xl font-bold">Order #{order.id}</h1>
          <Link 
            to="/admin/orders" 
            className="text-blue-600 hover:text-blue-900"
          >
            Back to Orders
          </Link>
        </div>

        <div className="bg-white rounded-lg shadow p-6 mb-6">
          <div className="flex justify-between items-center mb-4">
            <h2 className="text-xl font-semibold">Order Details</h2>
            <select
              value={status}
              onChange={handleStatusChange}
              className={`px-3 py-1 rounded-full text-sm font-medium ${
                status === 'completed' ? 'bg-green-100 text-green-800' :
                status === 'pending' ? 'bg-yellow-100 text-yellow-800' :
                'bg-red-100 text-red-800'
              }`}
            >
              <option value="pending">Pending</option>
              <option value="processing">Processing</option>
              <option value="completed">Completed</option>
              <option value="cancelled">Cancelled</option>
            </select>
          </div>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-6">
            <div>
              <h3 className="font-medium text-gray-600 mb-2">Customer</h3>
              <p>{order.user?.name || 'Guest'}</p>
              <p>{order.user?.email || 'No email provided'}</p>
            </div>
            <div>
              <h3 className="font-medium text-gray-600 mb-2">Order Date</h3>
              <p>{new Date(order.created_at).toLocaleString()}</p>
            </div>
            <div>
              <h3 className="font-medium text-gray-600 mb-2">Total Amount</h3>
              <p className="font-bold">${order.total_amount.toLocaleString()}</p>
            </div>
            <div>
              <h3 className="font-medium text-gray-600 mb-2">Payment Method</h3>
              <p>{order.payment_method || 'N/A'}</p>
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
              <h3 className="font-medium text-gray-600 mb-2">Contact</h3>
              <p>Phone: {order.shipping_address?.phone || 'N/A'}</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default AdminOrderDetail;