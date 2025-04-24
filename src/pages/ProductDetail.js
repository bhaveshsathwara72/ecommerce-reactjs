import React, { useState, useEffect } from 'react';
import { useParams } from 'react-router-dom';
import axios from '../utils/axios';
import { STORAGE_URL } from '../utils/constants';
import Header from '../components/layout/Header';
import Footer from '../components/layout/Footer';
import CartService from '../services/CartService';

const ProductDetail = () => {
  const [product, setProduct] = useState(null);
  const [quantity, setQuantity] = useState(1);
  const { id } = useParams();

  useEffect(() => {
    const fetchProduct = async () => {
      try {
        const response = await axios.get(`/products/${id}`);
        setProduct(response.data);
      } catch (error) {
        console.error('Error fetching product:', error);
      }
    };
    fetchProduct();
  }, [id]);

  if (!product) {
    return <div className="text-center py-12">Loading...</div>;
  }

  const handleQuantityChange = (value) => {
    const newValue = Math.max(1, Math.min(100, quantity + value));
    setQuantity(newValue);
  };

  const handleAddToCart = async () => {
    try {
      await CartService.addToCart(product.id, quantity);
      // alert('Item added to cart successfully!');
      window.location.href = '/cart';
    } catch (error) {
      console.error('Error adding to cart:', error);
      alert('Failed to add item to cart');
    }
  };

  return (
    <div className="min-h-screen flex flex-col">
      <Header />
      
      <main className="flex-grow container mx-auto px-4 py-8">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8">
          {/* Product Images */}
          <div className="bg-white p-4 rounded-lg shadow">
            <img 
              src={`${STORAGE_URL}${product.image}`}
              alt={product.name} 
              className="w-full rounded-lg"
            />
          </div>

          {/* Product Info */}
          <div className="bg-white p-6 rounded-lg shadow">
            <h1 className="text-3xl font-bold mb-2">{product.make} {product.model}</h1>
            <p className="text-gray-600 mb-4">{product.year} • {product.mileage} miles</p>
            <p className="text-2xl text-blue-600 font-bold mb-6">${product.price.toLocaleString()}</p>
            
            <div className="mb-6">
              <h3 className="text-lg font-semibold mb-2">Description</h3>
              <p className="text-gray-700">{product.description}</p>
            </div>

            <div className="mb-6">
              <h3 className="text-lg font-semibold mb-2">Specifications</h3>
              <ul className="grid grid-cols-2 gap-2 text-gray-700">
                <li><span className="font-medium">Make:</span> {product.make}</li>
                <li><span className="font-medium">Model:</span> {product.model}</li>
                <li><span className="font-medium">Year:</span> {product.year}</li>
                <li><span className="font-medium">Mileage:</span> {product.mileage} miles</li>
                <li><span className="font-medium">Color:</span> {product.color || 'N/A'}</li>
                <li><span className="font-medium">Transmission:</span> {product.transmission || 'N/A'}</li>
              </ul>
            </div>

            <div className="flex items-center mb-6">
              <div className="flex items-center border rounded mr-4">
                <button 
                  onClick={() => handleQuantityChange(-1)}
                  className="px-3 py-1 text-xl"
                >
                  -
                </button>
                <span className="px-4 py-1">{quantity}</span>
                <button 
                  onClick={() => handleQuantityChange(1)}
                  className="px-3 py-1 text-xl"
                >
                  +
                </button>
              </div>
              <button 
                onClick={handleAddToCart}
                className="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700 transition-colors"
              >
                Add to Cart
              </button>
            </div>
          </div>
        </div>
      </main>

      <Footer />
    </div>
  );
};

export default ProductDetail;