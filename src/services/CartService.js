import axios from '../utils/axios';

const CartService = {
  getCartItems: async () => {
    const response = await axios.get('/cart');
    return response.data;
  },

  addToCart: async (productId, quantity = 1) => {
    try {
      const response = await axios.post('/cart', { "product_id":productId, quantity });
      return response.data;
    } catch (error) {
      if (error.response?.status === 401) {
        // Redirect to login page if unauthorized
        window.location.href = '/login?redirect=/product/' + productId;
      }
      throw error;
    }
  },

  updateQuantity: async (productId, quantity) => {
    const response = await axios.put(`/cart/${productId}`, { quantity });
    return response.data;
  },

  removeFromCart: async (productId) => {
    await axios.delete(`/cart/${productId}`);
  },

  clearCart: async () => {
    await axios.delete('/cart');
  },

  createOrder: async (orderData) => {
    const response = await axios.post('/orders', orderData);
    return response.data;
  }
};

export default CartService;