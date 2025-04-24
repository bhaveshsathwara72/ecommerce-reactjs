import { Navigate, useLocation } from 'react-router-dom';
import { useAuth } from '../../contexts/AuthContext';

const ProtectedRoute = ({ children }) => {
  const { isAuthenticated } = useAuth();
  const location = useLocation();

  // Check if the route is an admin route
  const isAdminRoute = location.pathname.startsWith('/admin');

  if (isAdminRoute && !isAuthenticated) {
    // Redirect to login with the return path
    return <Navigate to="/admin/login" state={{ from: location }} replace />;
  }
  
  if (!isAuthenticated) {
    // Redirect to login with the return path
    return <Navigate to="/login" state={{ from: location }} replace />;
  }



  return children;
};

export default ProtectedRoute;