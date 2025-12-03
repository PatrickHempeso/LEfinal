import axios from 'axios';

// Create Axios instance
const axiosClient = axios.create({
  baseURL: 'http://127.0.0.1:8000/api',
  withCredentials: true, // If using Laravel Sanctum cookies
});

// Request interceptor to attach token automatically
axiosClient.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('authToken');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => Promise.reject(error)
);

// Response interceptor to handle 401 globally
axiosClient.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response?.status === 401) {
      localStorage.clear();
      window.location.href = '/login'; // Redirect to login on unauthorized
    }
    return Promise.reject(error);
  }
);

// Login function
export const loginUser = async (login, password) => {
  try {
    const res = await axiosClient.post('/login', { login, password });
    const { type, token, user } = res.data;

    if (token) localStorage.setItem('authToken', token);
    if (user?.firstName) localStorage.setItem('userFirstName', user.firstName);
    localStorage.setItem('userType', type);

    return { type, user };
  } catch (err) {
    console.error('Login failed:', err.response?.data || err.message);
    throw err;
  }
};

// Logout function
export const logoutUser = () => {
  localStorage.clear();
  window.location.href = '/login';
};

export default axiosClient;
