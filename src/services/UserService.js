import axios from '../utils/axios';

const UserService = {
  getAll: async () => {
    try {
      const response = await axios.get('/users');
      return response.data;
    } catch (error) {
      console.error('Error fetching users:', error);
      throw error;
    }
  },

  create: async (userData) => {
    try {
      const response = await axios.post('/users', userData);
      return response.data;
    } catch (error) {
      console.error('Error creating user:', error);
      throw error;
    }
  },

  update: async (id, userData) => {
    try {
      const response = await axios.put(`/users/${id}`, userData);
      return response.data;
    } catch (error) {
      console.error('Error updating user:', error);
      throw error;
    }
  },

  delete: async (id) => {
    try {
      await axios.delete(`/users/${id}`);
    } catch (error) {
      console.error('Error deleting user:', error);
      throw error;
    }
  }
};

export default UserService;