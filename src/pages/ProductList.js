import React, { useState, useEffect } from 'react';
import { useSearchParams } from 'react-router-dom';
import ProductCard from '../components/product/ProductCard';
import ProductService from '../services/ProductService';
import Header from '../components/layout/Header';
import Footer from '../components/layout/Footer';

const ProductList = () => {
  const [products, setProducts] = useState([]);
  const [loading, setLoading] = useState(true);
  const [searchParams] = useSearchParams();
  const [filters, setFilters] = useState({
    category: searchParams.get('category') || '',
    price_min: searchParams.get('price_min') || '',
    price_max: searchParams.get('price_max') || '',
    sort: searchParams.get('sort') || 'newest'
  });

  useEffect(() => {
    fetchProducts();
  }, [filters]);

  const fetchProducts = async () => {
    try {
      setLoading(true);
      const products = await ProductService.getAll(filters);
      setProducts(products);
    } catch (error) {
      console.error('Error fetching products:', error);
    } finally {
      setLoading(false);
    }
  };

  const handleFilterChange = (e) => {
    const { name, value } = e.target;
    setFilters(prev => ({ ...prev, [name]: value }));
  };

  return (
    <div className="min-h-screen flex flex-col">
      <Header />
      
      <main className="flex-grow container mx-auto px-4 py-8">
        <div className="flex flex-col md:flex-row gap-8">
          {/* Filters Sidebar */}
          <div className="w-full md:w-64 bg-white p-4 shadow rounded-lg">
            <h3 className="font-bold text-lg mb-4">Filters</h3>
            
            <div className="mb-4">
              <label className="block text-sm font-medium mb-1">Category</label>
              <select
                name="category"
                value={filters.category}
                onChange={handleFilterChange}
                className="w-full border rounded p-2"
              >
                <option value="">All Categories</option>
                {/* Add your categories here */}
              </select>
            </div>

            <div className="mb-4">
              <label className="block text-sm font-medium mb-1">Price Range</label>
              <div className="flex gap-2">
                <input
                  type="number"
                  name="price_min"
                  placeholder="Min"
                  value={filters.price_min}
                  onChange={handleFilterChange}
                  className="w-1/2 border rounded p-2"
                />
                <input
                  type="number"
                  name="price_max"
                  placeholder="Max"
                  value={filters.price_max}
                  onChange={handleFilterChange}
                  className="w-1/2 border rounded p-2"
                />
              </div>
            </div>

            <div className="mb-4">
              <label className="block text-sm font-medium mb-1">Sort By</label>
              <select
                name="sort"
                value={filters.sort}
                onChange={handleFilterChange}
                className="w-full border rounded p-2"
              >
                <option value="newest">Newest First</option>
                <option value="price_asc">Price: Low to High</option>
                <option value="price_desc">Price: High to Low</option>
              </select>
            </div>
          </div>

          {/* Products Grid */}
          <div className="flex-grow">
            <div className="flex justify-between items-center mb-6">
              <h2 className="text-2xl font-bold">All Products</h2>
              <div className="text-sm text-gray-500">
                Showing {products.length} products
              </div>
            </div>

            {loading ? (
              <div className="text-center py-12">Loading products...</div>
            ) : (
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                {products.map(product => (
                  <ProductCard key={product.id} product={product} />
                ))}
              </div>
            )}

            {/* Pagination would go here */}
          </div>
        </div>
      </main>

      <Footer />
    </div>
  );
};

export default ProductList;