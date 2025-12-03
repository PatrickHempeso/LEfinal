import React, { useState, useEffect } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import AppHeader from '../components/AppHeader';
import api from '../services/api';

function Login() {
  const [formData, setFormData] = useState({ login: '', password: '' });
  const [errors, setErrors] = useState({});
  const [isSubmitting, setIsSubmitting] = useState(false);
  const navigate = useNavigate();

  useEffect(() => {
  const accepted = localStorage.getItem('termsAccepted') === 'true';
    const isLoggedIn = localStorage.getItem('isLoggedIn') === 'true';

    // Only redirect if user is going to dashboard, not login page
    if (!accepted && !isLoggedIn && !window.location.pathname.startsWith('/login') && window.location.pathname !== '/terms') {
      navigate('/terms');
    }
  }, [navigate]);

  const validateForm = () => {
    const newErrors = {};
    if (!formData.login.trim()) newErrors.login = 'Email or Username is required';
    // Password only required if login is not "guest"
    if (formData.login.trim() !== 'guest' && !formData.password.trim()) {
      newErrors.password = 'Password is required';
    }
    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
    if (errors[name]) setErrors(prev => ({ ...prev, [name]: '' }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!validateForm()) return;

    setIsSubmitting(true);

    try {
      await api.get('/sanctum/csrf-cookie');

      const res = await api.post('/api/login', {
        login: formData.login,
        password: formData.password
      });

      const data = res.data;
      const user = data.faculty || data.student;

      localStorage.setItem('isLoggedIn', 'true');
      localStorage.setItem('authToken', data.token);
      localStorage.setItem('userID', user?.FacultyID || user?.StudentID || '');
      localStorage.setItem('userFirstName', user?.FirstName || '');
      localStorage.setItem('userLastName', user?.LastName || '');
      localStorage.setItem('userType', data.type);

      if (data.type === 'faculty') {
        navigate('/dashboard/faculty');
      } else if (data.type === 'student') {
        navigate('/dashboard/student');
      } else {
        // Guest login fallback
        navigate('/dashboard/guest');
      }

    } catch (err) {
      console.error(err);
      alert(err.response?.data?.error || 'Login failed. Check server or network.');
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <div className="app-container">
      <AppHeader title="LOGIN" />
      <div className="app-body">
        <form className="auth-form" onSubmit={handleSubmit}>

          <div className="form-group">
            <label htmlFor="login">Email or Username</label>
            <input
              type="text"
              id="login"
              name="login"
              value={formData.login}
              onChange={handleChange}
              placeholder="Enter email or username"
              className={errors.login ? 'error' : ''}
            />
            {errors.login && <span className="error-message">{errors.login}</span>}
          </div>

          <div className="form-group">
            <label htmlFor="password">Password</label>
            <input
              type="password"
              id="password"
              name="password"
              value={formData.password}
              onChange={handleChange}
              placeholder="Enter your password"
              className={errors.password ? 'error' : ''}
            />
            {errors.password && <span className="error-message">{errors.password}</span>}
          </div>

          <div className="form-actions">
            <button type="submit" className="btn btn-primary" disabled={isSubmitting}>
              {isSubmitting ? 'Logging in...' : 'Login'}
            </button>
            <Link to="/" className="btn btn-secondary">Back</Link>
          </div>

        </form>
      </div>
    </div>
  );
}

export default Login;