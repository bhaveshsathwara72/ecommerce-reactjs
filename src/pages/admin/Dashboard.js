import React from 'react';

const Dashboard = () => {
  return (
    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
      {/* Stats Cards */}
      <div className="bg-white p-6 rounded-lg shadow">
        <h3 className="text-gray-500 text-sm font-medium">Total Sales</h3>
        <p className="mt-2 text-3xl font-bold">$24,000</p>
        <p className="mt-1 text-green-600">↑ 12% from last month</p>
      </div>
      
      <div className="bg-white p-6 rounded-lg shadow">
        <h3 className="text-gray-500 text-sm font-medium">Total Orders</h3>
        <p className="mt-2 text-3xl font-bold">156</p>
        <p className="mt-1 text-green-600">↑ 8% from last month</p>
      </div>
      
      <div className="bg-white p-6 rounded-lg shadow">
        <h3 className="text-gray-500 text-sm font-medium">Total Products</h3>
        <p className="mt-2 text-3xl font-bold">89</p>
        <p className="mt-1 text-blue-600">Active products</p>
      </div>
      
      <div className="bg-white p-6 rounded-lg shadow">
        <h3 className="text-gray-500 text-sm font-medium">Total Users</h3>
        <p className="mt-2 text-3xl font-bold">2,450</p>
        <p className="mt-1 text-green-600">↑ 4% from last month</p>
      </div>
    </div>
  );
};

export default Dashboard;