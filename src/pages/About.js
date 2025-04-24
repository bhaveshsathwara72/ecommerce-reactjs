import React from 'react';
import Header from '../components/layout/Header';
import Footer from '../components/layout/Footer';

const About = () => {
  return (
    <div className="min-h-screen flex flex-col">
      <Header />
      
      <main className="flex-grow container mx-auto px-4 py-12">
        <div className="max-w-4xl mx-auto">
          <h1 className="text-4xl font-bold text-center mb-8">About Our Car Dealership</h1>
          
          <div className="bg-white p-8 rounded-lg shadow-md">
            <h2 className="text-2xl font-semibold mb-4">Our Story</h2>
            <p className="text-gray-700 mb-6">
              Founded in 2010, our dealership has been providing quality vehicles to customers across the region. 
              We pride ourselves on offering a wide selection of cars, trucks, and SUVs to meet every need and budget.
            </p>
            
            <h2 className="text-2xl font-semibold mb-4">Our Mission</h2>
            <p className="text-gray-700 mb-6">
              To deliver exceptional customer service and quality vehicles at competitive prices. 
              We believe in building long-term relationships with our customers based on trust and transparency.
            </p>
            
            <h2 className="text-2xl font-semibold mb-4">Why Choose Us?</h2>
            <ul className="list-disc pl-6 text-gray-700 space-y-2">
              <li>Over 500 vehicles in stock</li>
              <li>Certified pre-owned options</li>
              <li>Competitive financing options</li>
              <li>Expert maintenance and service</li>
              <li>5-star customer satisfaction rating</li>
            </ul>
          </div>
        </div>
      </main>

      <Footer />
    </div>
  );
};

export default About;