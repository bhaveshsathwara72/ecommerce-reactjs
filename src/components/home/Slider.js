import React, { useState, useEffect } from 'react';
import { FaChevronLeft, FaChevronRight } from 'react-icons/fa';

const Slider = () => {
  const [currentSlide, setCurrentSlide] = useState(0);

  const slides = [
    {
      image: 'https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg',
      title: 'New Collection',
      description: 'Discover our latest arrivals'
    },
    {
      image: 'https://images.pexels.com/photos/9827762/pexels-photo-9827762.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      title: 'Special Offers',
      description: 'Up to 50% off on selected items'
    },
    {
      image: 'https://images.pexels.com/photos/9846158/pexels-photo-9846158.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
      title: 'Premium Quality',
      description: 'Handpicked products for you'
    }
  ];

  const nextSlide = () => {
    setCurrentSlide((prev) => (prev + 1) % slides.length);
  };

  const prevSlide = () => {
    setCurrentSlide((prev) => (prev - 1 + slides.length) % slides.length);
  };

  useEffect(() => {
    const timer = setInterval(nextSlide, 5000);
    return () => clearInterval(timer);
  }, []);

  return (
    <div className="relative h-[500px] overflow-hidden">
      {slides.map((slide, index) => (
        <div
          key={index}
          className={`absolute w-full h-full transition-transform duration-500 ${
            index === currentSlide ? 'translate-x-0' : 'translate-x-full'
          }`}
        >
          <div className="absolute inset-0 bg-black opacity-40"></div>
          <img
            src={slide.image}
            alt={slide.title}
            className="w-full h-full object-cover"
          />
          <div className="absolute inset-0 flex items-center justify-center text-center text-white">
            <div>
              <h2 className="text-4xl md:text-6xl font-bold mb-4">{slide.title}</h2>
              <p className="text-xl md:text-2xl">{slide.description}</p>
            </div>
          </div>
        </div>
      ))}
      
      <button
        onClick={prevSlide}
        className="absolute left-4 top-1/2 -translate-y-1/2 bg-white/30 p-2 rounded-full text-white hover:bg-white/50"
      >
        <FaChevronLeft size={24} />
      </button>
      <button
        onClick={nextSlide}
        className="absolute right-4 top-1/2 -translate-y-1/2 bg-white/30 p-2 rounded-full text-white hover:bg-white/50"
      >
        <FaChevronRight size={24} />
      </button>
    </div>
  );
};

export default Slider;