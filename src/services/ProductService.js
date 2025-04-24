import axios from '../utils/axios';

const ProductService = {
  getAll: async () => {
    try {
      const response = await axios.get('/products');
      return response.data;
    } catch (error) {
      console.error('Error fetching products:', error);
      throw error;
    }
  },
  getLatestCars: async () => {
    try {
      const response = await axios.get('/products/latest');
      return response.data;
    } catch (error) {
      console.error('Error fetching latest products:', error);
      throw error;
    }
  },
  getById: async (id) => {
    try {
      const response = await axios.get(`/products/${id}`);
      return response.data;
    } catch (error) {
      console.error('Error fetching product:', error);
      throw error;
    }
  },

  create: async (productData) => {
    try {
      const formData = new FormData();
      Object.keys(productData).forEach(key => {
        if (productData[key] !== null) {
          formData.append(key, productData[key]);
        }
      });
      
      const response = await axios.post('/products', formData, {
        headers: { 'Content-Type': 'multipart/form-data' }
      });
      return response.data;
    } catch (error) {
      console.error('Error creating product:', error);
      throw error;
    }
  },

  update: async (id, productData) => {
    try {
      const formData = new FormData();
      Object.keys(productData).forEach(key => {
        if (productData[key] !== null) {
          formData.append(key, productData[key]);
        }
      });
      
      const response = await axios.post(`/products/${id}`, formData, {
        headers: { 'Content-Type': 'multipart/form-data' }
      });
      return response.data;
    } catch (error) {
      console.error('Error updating product:', error);
      throw error;
    }
  },

  delete: async (id) => {
    try {
      await axios.delete(`/products/${id}`);
    } catch (error) {
      console.error('Error deleting product:', error);
      throw error;
    }
  }
};

export default ProductService;