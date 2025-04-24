import React, { createContext, useState, useContext, useEffect } from 'react';
import axios from '../utils/axios';

const AuthContext = createContext(null);

export const AuthProvider = ({ children }) => {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [isLoading, setIsLoading] = useState(true);
  const [currentUser, setCurrentUser] = useState(null);
  const [isAdmin, setIsAdmin] = useState(false);

  useEffect(() => {
    const checkAuth = async () => {
      const token = localStorage.getItem('token');
      const adminToken = localStorage.getItem('adminToken');
      
      if (adminToken) {
        try {
          axios.defaults.headers.common['Authorization'] = `Bearer ${adminToken}`;
          const response = await axios.get('/admin/verify');
          setIsAuthenticated(true);
          setIsAdmin(true);
          setCurrentUser({
            name: response.data.name || 'Admin',
            email: response.data.email,
            id: response.data.id
          });
        } catch (error) {
          localStorage.removeItem('adminToken');
          delete axios.defaults.headers.common['Authorization'];
        }
      } else if (token) {
        try {
          axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
          const response = await axios.get('/verify');
          setIsAuthenticated(true);
          setIsAdmin(false);
          setCurrentUser({
            name: response.data.name || 'User',
            email: response.data.email,
            id: response.data.id
          });
        } catch (error) {
          localStorage.removeItem('token');
          delete axios.defaults.headers.common['Authorization'];
        }
      }
      setIsLoading(false);
    };

    checkAuth();
  }, []);

  const logout = () => {
    localStorage.removeItem('token');
    localStorage.removeItem('adminToken');
    delete axios.defaults.headers.common['Authorization'];
    setIsAuthenticated(false);
    setCurrentUser(null);
    setIsAdmin(false);
  };

  return (
    <AuthContext.Provider value={{ 
      isAuthenticated, 
      setIsAuthenticated, 
      currentUser,
      isAdmin,
      logout, 
      isLoading 
    }}>
      {!isLoading && children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);