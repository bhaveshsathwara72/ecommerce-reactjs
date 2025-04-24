import axios from '../utils/axios';

const OrderService = {
  getOrders: async () => {
    const response = await axios.get('/orders');
    return response.data;
  },

  getAllOrders: async () => {
    const response = await axios.get('/orders/all');
    return response.data;
  },
  
  getOrderDetails: async (id) => {
    const response = await axios.get(`/orders/${id}`);
    return response.data;
  },
  
  updateOrderStatus: async (orderId, statusData) => {
    const response = await axios.put(`/admin/orders/${orderId}/status`, statusData);
    return response.data;
  }
};

export default OrderService;