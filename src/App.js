import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { AuthProvider } from './contexts/AuthContext';
import ProtectedRoute from './components/auth/ProtectedRoute';
import './App.css';


import Login from './pages/auth/Login';
import Register from './pages/auth/Register';
import Home from './pages/Home';
import ProductList from './pages/ProductList';
import ProductDetail from './pages/ProductDetail';
import Cart from './pages/Cart';
import CategoryList from './pages/CategoryList';
import About from './pages/About';
import Profile from './pages/Profile';
import Order from './pages/Order';
import OrderDetail from './pages/OrderDetail';

// Admin
import AdminLogin from './pages/auth/AdminLogin';
import Users from './pages/admin/Users';
import AdminLayout from './components/admin/AdminLayout';
import Dashboard from './pages/admin/Dashboard';
import Products from './pages/admin/Products';
import Categories from './pages/admin/Categories';
import AdminOrder from './pages/admin/Orders';
import AdminOrderDetail from './pages/admin/OrderDetail';

function App() {
  return (
    <AuthProvider>
      <Router>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/orders" element={<Order />} />
          <Route path="/orders/:id" element={<OrderDetail />} />
          <Route path="/categories" element={<CategoryList />} />
          <Route path="/products" element={<ProductList />} />
          <Route path="/product/:id" element={<ProductDetail />} />
          <Route path="/cart" element={<Cart />} />
          <Route path="/login" element={<Login />} />
          <Route path="/register" element={<Register />} />
          <Route path="/about" element={<About />} />
          <Route path="/profile" element={<Profile />} />

          {/* Protected Admin Routes */}
          <Route path="/admin/login" element={<AdminLogin />} />
          <Route
            path="/admin"
            element={
              <ProtectedRoute>
                <AdminLayout />
              </ProtectedRoute>
            }
          >
            <Route path="dashboard" element={<Dashboard />} />
            <Route path="products" element={<Products />} />
            <Route path="orders" element={<AdminOrder />} />
            <Route path="orders/:id" element={<AdminOrderDetail />} />
            <Route path="categories" element={<Categories />} />
            <Route path="users" element={<Users />} />
            
          </Route>
        </Routes>
      </Router>
    </AuthProvider>
  );
}

export default App;
