import React, { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import AppHeader from '../components/AppHeader';
import '../assets/design.css';

function GuestDashboard() {
  const [searchTerm, setSearchTerm] = useState('');
  const [currentPage, setCurrentPage] = useState(1);
  const [projects, setProjects] = useState([]);
  const navigate = useNavigate();

  // Fetch projects from Laravel API
  useEffect(() => {
    localStorage.setItem('guestMode', 'true'); // Set guest mode
    fetch('/api/dashboard/guest')
      .then(res => res.json())
      .then(response => setProjects(response.data))
      .catch(err => console.error("Error fetching projects:", err));
  }, []);

  // Reset page to 1 whenever searchTerm changes
  useEffect(() => {
    setCurrentPage(1);
  }, [searchTerm]);

  // Filter projects based on search term
  const filteredProjects = projects.filter(project => {
    const title = project.Title?.toLowerCase() || "";
    const authors = project.Authors?.toLowerCase() || "";
    const keywords = project.Keywords?.toLowerCase() || "";

    return (
      title.includes(searchTerm.toLowerCase()) ||
      authors.includes(searchTerm.toLowerCase()) ||
      keywords.includes(searchTerm.toLowerCase())
    );
  });

  // Pagination
  const projectsPerPage = 6;
  const totalPages = Math.ceil(filteredProjects.length / projectsPerPage);
  const startIndex = (currentPage - 1) * projectsPerPage;
  const paginatedProjects = filteredProjects.slice(startIndex, startIndex + projectsPerPage);

  const resetFilters = () => {
    setSearchTerm('');
    setCurrentPage(1);
  };

  const viewProject = (id) => {
    navigate(`/abstract/${id}`);
  };

  const goToPreviousPage = () => {
    if (currentPage > 1) setCurrentPage(currentPage - 1);
  };

  const goToNextPage = () => {
    if (currentPage < totalPages) setCurrentPage(currentPage + 1);
  };

  return (
    <div className="app-container">
      <AppHeader title="Guest Access" />

      <div className="dashboard-container">

        {/* Search & User Actions */}
        <div className="dashboard-header">
          <div className="search-bar">
            <input 
              type="text"
              placeholder="Search projects..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
            />
          </div>

          <div className="user-actions">
            <Link to="/login" className="btn btn-primary">Login</Link>
            <Link to="/" className="btn btn-secondary">Back</Link>
            <Link to="/register" className="btn btn-success">Register</Link>
          </div>
        </div>

        {/* Guest Notice */}
        <div className="dashboard-content">
          <div className="view-only-notice">
            <p>
              You are browsing as a guest.
              <span style={{ color: 'white' }}> Login or Register to access all features.</span>
            </p>
          </div>

          <div className="guest-actions">
            <button className="btn btn-secondary" onClick={resetFilters}>Reset</button>
          </div>

          {/* Projects Grid */}
          <div className="projects-grid">
            {paginatedProjects.map(project => (
              <div key={project.DocumentID} className="project-card">
                <div className="project-badge">📄</div>
                <h3>{project.Title}</h3>
                <p>{project.Program} {project.Type}</p>
                <p className="author">By: {project.Authors}</p>
                <p className="date">Published: {project.YearPublished}</p>
                <div className="project-excerpt">{project.Keywords}</div>
                <div className="actions">
                  <button className="btn btn-view" onClick={() => viewProject(project.DocumentID)}>
                    View Abstract
                  </button>
                </div>
              </div>
            ))}
            {filteredProjects.length === 0 && (
              <p style={{ gridColumn: '1 / -1', textAlign: 'center' }}>No projects found.</p>
            )}
          </div>

          {/* Pagination */}
          {totalPages > 1 && (
            <div className="pagination">
              <button className="btn btn-secondary" onClick={goToPreviousPage} disabled={currentPage === 1}>
                Previous
              </button>
              <span>Page {currentPage} of {totalPages}</span>
              <button className="btn btn-secondary" onClick={goToNextPage} disabled={currentPage === totalPages}>
                Next
              </button>
            </div>
          )}
        </div>

      </div>
    </div>
  );
}

export default GuestDashboard;
