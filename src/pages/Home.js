import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import Header from '../components/layout/Header';
import Footer from '../components/layout/Footer';
import Slider from '../components/home/Slider';
import axios from 'axios';
import ProductService from '../services/ProductService';
import CategoryService from '../services/CategoryService';
import { STORAGE_URL } from '../utils/constants';

const Home = () => {
  const [latestCars, setLatestCars] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchLatestCars = async () => {
      try {
        setLoading(true);
        const response = await ProductService.getLatestCars();
        console.log('API Response:', response);
        if (response) {
          setLatestCars(response);
        } else {
          setLatestCars([]); // Set empty array if no data
          console.warn('No data received from API');
        }
      } catch (error) {
        console.error('Error fetching products:', error);
        setLatestCars([]); // Set empty array on error
      } finally {
        setLoading(false);
      }
    };
    fetchLatestCars();
  }, []);

  const [categories, setCategories] = useState([]);
  const [categoriesLoading, setCategoriesLoading] = useState(true);

  useEffect(() => {
    const fetchCategories = async () => {
      try {
        const data = await CategoryService.getLatestCategory();
        setCategories(data);
      } catch (error) {
        console.error('Error fetching categories:', error);
      } finally {
        setCategoriesLoading(false);
      }
    };
    fetchCategories();
  }, []);

  return (
    <div className="home-page">
      <Header />
      
      {/* Hero Slider */}
      <section className="hero-slider">
        <Slider />
      </section>

      {/* Latest Car Models */}
      <section className="latest-cars py-12 bg-gray-50">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold text-center mb-8">Latest Car Models</h2>
          {loading ? (
                <div className="text-center">Loading...</div>
              ) : (
                  <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
                    {latestCars && latestCars.length > 0 ? (
                      latestCars.map(car => (
                        <div key={car.id} className="bg-white p-6 rounded-lg shadow-md hover:shadow-lg transition-shadow">
                          <div className="h-48 mb-4 rounded overflow-hidden">
                            <img 
                              src={STORAGE_URL  +  car.image } 
                              alt={car.model}
                              className="w-full h-full object-cover"
                            />
                          </div>
                          <h3 className="text-xl font-semibold mb-1">{car.make} {car.model}</h3>
                          {car.category && (
                            <p className="text-sm text-blue-600 mb-1">{car.category.name}</p>
                          )}
                          <p className="text-gray-600 mb-2">{car.year} • {car.mileage} miles</p>
                          <p className="text-lg font-bold mb-4">${car.price.toLocaleString()}</p>
                          <Link
                            to={`/product/${car.id}`}
                            className="block w-full bg-blue-600 text-white py-2 text-center rounded hover:bg-blue-700 transition-colors"
                          >
                            View Details
                          </Link>
                        </div>
                      ))
                    ) : (
                      <div className="col-span-3 text-center">No cars available</div>
                    )}
            </div>
          )}
        </div>
      </section>

      {/* Call to Action */}
      <section className="cta py-16 bg-blue-800 text-white">
        <div className="container mx-auto px-4 text-center">
          <h2 className="text-3xl font-bold mb-4">Find Your Perfect Car</h2>
          <p className="text-xl mb-8">Browse our extensive inventory of quality vehicles</p>
          <Link
            to="/inventory"
            className="inline-block bg-white text-blue-800 px-8 py-3 rounded-lg font-bold hover:bg-gray-100 transition-colors"
          >
            View Full Inventory
          </Link>
        </div>
      </section>

      {/* Categories Section */}
      <section className="categories py-12 bg-white">
        <div className="container mx-auto px-4">
          <h2 className="text-3xl font-bold text-center mb-8">Popular Categories</h2>
          {categoriesLoading ? (
            <div className="text-center">Loading categories...</div>
          ) : (
            <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
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
                  Browse {category.name} →
                  </h3>
                </Link>
              ))}
            </div>
          )}
        </div>
      </section>
      <Footer />
    </div>
  );
};

export default Home;