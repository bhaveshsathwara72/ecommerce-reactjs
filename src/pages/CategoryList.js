import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import CategoryService from '../services/CategoryService';
import Header from '../components/layout/Header';
import Footer from '../components/layout/Footer';
import { STORAGE_URL } from '../utils/constants';

const CategoryList = () => {
  const [categories, setCategories] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchCategories = async () => {
      try {
        setLoading(true);
        const categories = await CategoryService.getAll();
        setCategories(categories);
      } catch (error) {
        console.error('Error fetching categories:', error);
      } finally {
        setLoading(false);
      }
    };
    fetchCategories();
  }, []);

  return (
    <div className="min-h-screen flex flex-col">
      <Header />
      
      <main className="flex-grow container mx-auto px-4 py-8">
        <div className="mb-8 text-center">
          <h1 className="text-3xl font-bold">All Categories</h1>
          <p className="text-gray-600 mt-2">Browse our wide range of vehicle categories</p>
        </div>

        {loading ? (
          <div className="text-center py-12">Loading categories...</div>
        ) : (
          <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
            {categories.map(category => (
              <Link 
                key={category.id}
                to={`/products?category=${category.slug}`}
                className="group bg-white p-4 rounded-lg shadow-sm hover:shadow-md transition-all duration-300 flex flex-col items-center"
              >
                <div className="relative w-full h-40 mb-4 rounded-lg overflow-hidden">
                  <img 
                    src={STORAGE_URL + category.image} 
                    alt={category.name}
                    className="w-full h-full object-cover group-hover:scale-105 transition-transform duration-300"
                  />
                  <div className="absolute inset-0 bg-gradient-to-t from-black/20 to-transparent"></div>
                </div>
                <h3 className="text-lg font-semibold text-gray-800 group-hover:text-blue-600 transition-colors">
                  {category.name}
                </h3>
                <span className="mt-1 text-sm text-blue-500">Browse {category.name} →</span>
              </Link>
            ))}
          </div>
        )}
      </main>

      <Footer />
    </div>
  );
};

export default CategoryList;