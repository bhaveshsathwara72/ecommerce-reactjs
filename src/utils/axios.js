import axios from 'axios';

const instance = axios.create({
  baseURL: 'http://localhost:8000/api',
  headers: {
    'Content-Type': 'application/json'
  }
});

// Add a request interceptor to include the token
instance.interceptors.request.use(
  (config) => {
    // Check for admin token first
    const adminToken = localStorage.getItem('adminToken');
    if (adminToken) {
      config.headers.Authorization = `Bearer ${adminToken}`;
      return config;
    }

    // If no admin token, check for user token
    const userToken = localStorage.getItem('token');
    if (userToken) {
      config.headers.Authorization = `Bearer ${userToken}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// Add a response interceptor to handle authentication errors
instance.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response && error.response.status === 401) {
      // Clear tokens on authentication error
      localStorage.removeItem('adminToken');
      localStorage.removeItem('token');
      delete instance.defaults.headers.common['Authorization'];
    }
    return Promise.reject(error);
  }
);

export default instance;