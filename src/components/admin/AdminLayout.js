import React from 'react';
import { Outlet, Navigate, Link } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';
import axios from '../../utils/axios';

const AdminLayout = () => {
  const { isAuthenticated, logout } = useAuth();

  if (!isAuthenticated) {
    return <Navigate to="/admin/login" replace />;
  }

  const handleLogout = async () => {
    try {
      await axios.post('/admin/logout');
      logout();
    } catch (error) {
      console.error('Logout error:', error);
    }
  };

  return (
    <div className="flex h-screen bg-gray-100">
      {/* Admin Sidebar */}
      <div className="w-64 bg-white shadow-md">
        <div className="p-4">
          <h2 className="text-xl font-semibold text-gray-800">Admin Dashboard</h2>
        </div>
        <nav className="mt-4">
          <Link to="/admin/dashboard" className="block px-4 py-2 text-gray-600 hover:bg-gray-100">
            Dashboard
          </Link>
          <Link to="/admin/users" className="block px-4 py-2 text-gray-600 hover:bg-gray-100">
            Users
          </Link>
          <Link to="/admin/categories" className="block px-4 py-2 text-gray-600 hover:bg-gray-100">
            Categories
          </Link>
          <Link to="/admin/products" className="block px-4 py-2 text-gray-600 hover:bg-gray-100">
            Products
          </Link>
          <Link to="/admin/orders" className="block px-4 py-2 text-gray-600 hover:bg-gray-100">
            Orders
          </Link>
          <button
            onClick={handleLogout}
            className="block w-full text-left px-4 py-2 text-red-600 hover:bg-gray-100"
          >
            Logout
          </button>
        </nav>
      </div>

      {/* Main Content */}
      <div className="flex-1 p-8 overflow-auto">
        <Outlet />
      </div>
    </div>
  );
};

export default AdminLayout;