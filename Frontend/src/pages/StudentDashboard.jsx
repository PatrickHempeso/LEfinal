import React, { useEffect, useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import axiosClient from '../services/axiosClient';
import '../assets/design.css'; 

function StudentDashboard() {
  const [studentName, setStudentName] = useState('');
  const navigate = useNavigate();

  useEffect(() => {
    const token = localStorage.getItem('authToken');
    if (!token) {
      navigate('/login');
      return;
    }

    const fetchStudentInfo = async () => {
      try {
        const res = await axiosClient.get('/student/dashboard');
        setStudentName(res.data.student.firstName || 'Student');
      } catch (err) {
        console.error(err);
        if (err.response?.status === 401) navigate('/login');
      }
    };

    fetchStudentInfo();
  }, [navigate]);

  const handleLogout = () => {
    localStorage.clear();
    navigate('/login');
  };

  return (
    <div className="app-container">
      <div className="app-header">
        <div className="logo">
          <img src="logo.png" alt="University Logo" />
        </div>
        <h1>STUDENT DASHBOARD</h1>
      </div>

      <div className="app-body">
        <h2>Welcome, {studentName}</h2>

        <div className="dashboard-actions">
          <Link to="/submit" className="btn btn-primary">Submit Project</Link>
          {/* Updated to route directly to StudentViewDocs */}
          <Link to="/view-docs" className="btn btn-primary">View Projects</Link>
          <button onClick={handleLogout} className="btn btn-secondary">Logout</button>
        </div>
      </div>
    </div>
  );
}

export default StudentDashboard;
