import React, { useState, useEffect } from 'react';
import axios from '../../utils/axios';

const CategoryModal = ({ isOpen, onClose, onCategoryAdded, onCategoryUpdated, category }) => {
  const [formData, setFormData] = useState({
    name: '',
    slug: '',
    description: '',
    image: null
  });
  const [isSubmitting, setIsSubmitting] = useState(false);

  useEffect(() => {
    if (category) {
      setFormData({
        name: category.name,
        slug: category.slug,
        description: category.description,
        image: category.image
      });
    } else {
      setFormData({
        name: '',
        slug: '',
        description: '',
        image: null
      });
    }
  }, [category]);

  const handleSubmit = async (e) => {
    e.preventDefault();
    setIsSubmitting(true);
    
    try {
      const formDataToSend = new FormData();
      formDataToSend.append('name', formData.name);
      formDataToSend.append('slug', formData.slug);
      formDataToSend.append('description', formData.description);
      if (formData.image) {
        formDataToSend.append('image', formData.image);
      }
      
      if (category) {
        const response = await axios.post(`/categories/${category.id}`, formDataToSend, {
          headers: { 'Content-Type': 'multipart/form-data' }
        });
        onCategoryUpdated(response.data);
      } else {
        const response = await axios.post('/categories', formDataToSend, {
          headers: { 'Content-Type': 'multipart/form-data' }
        });
        onCategoryAdded(response.data);
      }
      
      onClose();
    } catch (error) {
      console.error('Error saving category:', error);
    } finally {
      setIsSubmitting(false);
    }
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
  };

  const handleFileChange = (e) => {
    setFormData(prev => ({ ...prev, image: e.target.files[0] }));
  };

  if (!isOpen) return null;

  return (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
      <div className="bg-white p-6 rounded-lg w-full max-w-md">
        <h3 className="text-xl font-bold mb-4">
          {category ? 'Edit Category' : 'Add New Category'}
        </h3>
        <form onSubmit={handleSubmit} className="space-y-4">
          <div>
            <label className="block mb-1">Name</label>
            <input
              type="text"
              name="name"
              value={formData.name}
              onChange={handleChange}
              className="w-full border rounded px-3 py-2"
              required
            />
          </div>
          <div>
            <label className="block mb-1">Slug</label>
            <input
              type="text"
              name="slug"
              value={formData.slug}
              onChange={handleChange}
              className="w-full border rounded px-3 py-2"
              required
            />
          </div>
          <div>
            <label className="block mb-1">Description</label>
            <textarea
              name="description"
              value={formData.description}
              onChange={handleChange}
              className="w-full border rounded px-3 py-2"
              rows="3"
            />
          </div>
          <div>
            <label className="block mb-1">Image</label>
            <input
              type="file"
              onChange={handleFileChange}
              className="w-full border rounded px-3 py-2"
              accept="image/*"
              required={!category}
            />
            {category?.image && (
              <p className="text-sm text-gray-500 mt-1">
                Current image: {category.image}
              </p>
            )}
          </div>
          <div className="flex justify-end space-x-2 mt-6">
            <button
              type="button"
              onClick={onClose}
              className="px-4 py-2 border rounded text-gray-600 hover:bg-gray-100"
              disabled={isSubmitting}
            >
              Cancel
            </button>
            <button
              type="submit"
              className="px-4 py-2 bg-blue-500 text-white rounded hover:bg-blue-600 disabled:bg-blue-300"
              disabled={isSubmitting}
            >
              {isSubmitting ? 'Saving...' : category ? 'Update' : 'Add'} Category
            </button>
          </div>
        </form>
      </div>
    </div>
  );
};

export default CategoryModal;