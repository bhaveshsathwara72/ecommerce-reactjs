import React from 'react';
import { Link } from 'react-router-dom';
import { STORAGE_URL } from '../../utils/constants';

const ProductCard = ({ product }) => {
  return (
    <div className="bg-white rounded-lg shadow-md overflow-hidden p-4">
      <Link to={`/product/${product.id}`}>
        <img
          src={`${STORAGE_URL}${product.images ? JSON.parse(product.images)[0] : product.image}`}
          alt={`${product.make} ${product.model}`}
          className="w-full h-48 object-cover rounded-lg"
        />
        <div className="p-4">
          <h3 className="text-xl font-semibold">{product.make} {product.model}</h3>
          <p className="text-gray-600">{product.year} • {product.mileage} miles</p>
          <p className="text-lg font-bold my-2">${product.price.toLocaleString()}</p>
          <div className="flex flex-wrap gap-1 mb-3">
            <span className="text-sm bg-gray-100 px-2 py-1 rounded">{product.fuel_type}</span>
            <span className="text-sm bg-gray-100 px-2 py-1 rounded">{product.transmission}</span>
            <span className="text-sm bg-gray-100 px-2 py-1 rounded">{product.condition}</span>
          </div>
          <Link 
            to={`/product/${product.id}`}
            className="block w-full bg-blue-600 text-white text-center py-2 rounded hover:bg-blue-700 transition-colors"
          >
            View Details
          </Link>
        </div>
      </Link>
    </div>
  );
};

export default ProductCard;