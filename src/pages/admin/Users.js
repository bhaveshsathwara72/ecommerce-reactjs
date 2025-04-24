import React, { useState, useEffect } from 'react';
import axios from '../../utils/axios';
import UserModal from '../../components/admin/UserModal';
import UserService from '../../services/UserService';

const Users = () => {
  const [users, setUsers] = useState([]);
  const [isModalOpen, setIsModalOpen] = useState(false);
  const [currentUser, setCurrentUser] = useState(null);

  useEffect(() => {
    fetchUsers();
  }, []);

  const fetchUsers = async () => {
    try {
      const users = await UserService.getAll();
      setUsers(users);
    } catch (error) {
      console.error('Error fetching users:', error);
    }
  };

  const handleUserAdded = (newUser) => {
    setUsers([...users, newUser]);
  };

  const handleUserUpdated = (updatedUser) => {
    setUsers(users.map(u => 
      u.id === updatedUser.id ? updatedUser : u
    ));
  };

  const handleEdit = (user) => {
    setCurrentUser(user);
    setIsModalOpen(true);
  };

  const handleDelete = async (userId) => {
    if (window.confirm('Are you sure you want to delete this user?')) {
      try {
        await UserService.delete(userId);
        setUsers(users.filter(user => user.id !== userId));
        // Optional: Add toast notification for success
        // toast.success('User deleted successfully');
      } catch (error) {
        console.error('Error deleting user:', error);
        // Optional: Add toast notification for error
        // toast.error('Failed to delete user');
        // Optionally show more detailed error message
        // toast.error(error.response?.data?.message || 'Failed to delete user');
      }
    }
  };

  return (
    <div>
      <div className="flex justify-between items-center mb-6">
        <h2 className="text-2xl font-bold">Users Management</h2>
        <button 
          onClick={() => {
            setCurrentUser(null);
            setIsModalOpen(true);
          }}
          className="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600"
        >
          Add New User
        </button>
      </div>

      <div className="bg-white shadow rounded-lg overflow-hidden">
        <table className="min-w-full divide-y divide-gray-200">
          <thead className="bg-gray-50">
            <tr>
              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">ID</th>
              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Name</th>
              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Email</th>
              <th className="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase">Actions</th>
            </tr>
          </thead>
          <tbody className="bg-white divide-y divide-gray-200">
            {users.map(user => (
              <tr key={user.id}>
                <td className="px-6 py-4 whitespace-nowrap">{user.id}</td>
                <td className="px-6 py-4 whitespace-nowrap">{user.name}</td>
                <td className="px-6 py-4 whitespace-nowrap">{user.email}</td>
                <td className="px-6 py-4 whitespace-nowrap">
                  <button 
                    onClick={() => handleEdit(user)}
                    className="text-blue-600 hover:text-blue-900 mr-3"
                  >
                    Edit
                  </button>
                  <button 
                    onClick={() => handleDelete(user.id)}
                    className="text-red-600 hover:text-red-900"
                  >
                    Delete
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
      <UserModal
        isOpen={isModalOpen}
        onClose={() => {
          setIsModalOpen(false);
          setCurrentUser(null);
        }}
        onUserAdded={handleUserAdded}
        onUserUpdated={handleUserUpdated}
        user={currentUser}
      />
    </div>
  );
};

export default Users;