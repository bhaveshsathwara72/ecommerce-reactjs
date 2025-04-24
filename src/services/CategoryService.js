import axios from '../utils/axios';

const CategoryService = {
  getAll: async () => {
    try {
      const response = await axios.get('/categories');
      return response.data;
    } catch (error) {
      console.error('Error fetching categories:', error);
      throw error;
    }
  },
  getLatestCategory: async () => {
    try {
      const response = await axios.get('/categories/latest');
      return response.data;
    } catch (error) {
      console.error('Error fetching latest categories:', error);
      throw error;
    }
  },
  getById: async (id) => {
    try {
      const response = await axios.get(`/categories/${id}`);
      return response.data;
    } catch (error) {
      console.error('Error fetching category:', error);
      throw error;
    }
  },

  create: async (categoryData) => {
    try {
      const response = await axios.post('/categories', categoryData);
      return response.data;
    } catch (error) {
      console.error('Error creating category:', error);
      throw error;
    }
  },

  update: async (id, categoryData) => {
    try {
      const response = await axios.put(`/categories/${id}`, categoryData);
      return response.data;
    } catch (error) {
      console.error('Error updating category:', error);
      throw error;
    }
  },

  delete: async (id) => {
    try {
      await axios.delete(`/categories/${id}`);
    } catch (error) {
      console.error('Error deleting category:', error);
      throw error;
    }
  }
};

export default CategoryService;