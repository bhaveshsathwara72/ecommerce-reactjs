# E-Commerce React App with Laravel Backend

A full-stack e-commerce application built with React frontend and Laravel backend.

## Features

- **User Authentication**: Admin login system with JWT tokens
- **Product Management**: View and manage products
- **Order Processing**: Create, view and update order statuses
- **Admin Dashboard**: Comprehensive admin interface for managing:
  - Users
  - Products
  - Categories
  - Orders

## Tech Stack

### Frontend
- React
- React Router
- Context API for state management
- Axios for API calls
- Tailwind CSS (based on UI components seen)

### Backend
- Laravel
- RESTful API
- JWT Authentication
- MySQL (assumed from Laravel setup)

## Project Structure

## Installation and Setup

### Frontend (React)
1. Navigate to the project root directory
2. Install dependencies:
```bash
npm install
```


## Deployment Options
### Frontend Deployment
1. Netlify/Vercel:
   
   - Connect your Git repository
   - Set build command: npm run build
   - Set publish directory: build
2. Static Hosting (AWS S3, Firebase Hosting, etc.):
   
   - Upload contents of build folder
### Backend Deployment
1. Shared Hosting (cPanel):
   
   - Upload backend folder contents
   - Set public folder as public_html
   - Configure .env settings
2. VPS (DigitalOcean, Linode, etc.):
   
   - Set up LAMP/LEMP stack
   - Configure virtual host
   - Deploy using Git or FTP
3. Platform as a Service:
   
   - Heroku: Use PHP buildpack
   - Laravel Forge: Automated deployment
   - AWS Elastic Beanstalk