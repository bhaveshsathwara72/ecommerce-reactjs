import React from "react";

import Header from '../components/layout/Header';
import Footer from '../components/layout/Footer';

const Profile = () => {
  return (
    <div className="min-h-screen flex flex-col" >
    <Header />
    <main className="flex-grow container mx-auto px-4 py-8">
    <div className="flex justify-center items-center ">
      <div className="bg-white w-full max-w-xl p-6 rounded-2xl shadow-lg ">
        <h2 className="text-2xl font-semibold mb-6 text-center">Edit Profile</h2>


        <form className="space-y-4">
          {/* Name */}
          <div>
            <label className="block text-gray-700 mb-1">Name</label>
            <input type="text" value="Bhavesh Sathwara" className="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
          </div>

          {/* Email */}
          <div>
            <label className="block text-gray-700 mb-1">Email</label>
            <div className="flex items-center gap-2">
              <input type="email" value="sathwarainfotech@gmail.com" disabled className="w-full px-4 py-2 border rounded-lg bg-gray-100 cursor-not-allowed" />
            </div>
          </div>


          {/* Save Button */}
          <button type="submit" className="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded-lg transition duration-300">
            Save
          </button>
        </form>
      </div>
    </div>
    </main>
    <Footer />
    </div>
  );
};

export default Profile;
