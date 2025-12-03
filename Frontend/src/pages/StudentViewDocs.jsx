import React, { useState, useEffect } from 'react';
import { useNavigate } from 'react-router-dom';
import AppHeader from '../components/AppHeader';
import axiosClient from '../services/axiosClient';
import '../assets/design.css';

function StudentViewDocs() {
  const [searchTerm, setSearchTerm] = useState('');
  const [currentPage, setCurrentPage] = useState(1);
  const [projects, setProjects] = useState([]);
  const navigate = useNavigate();

  // Fetch all published projects for student
  useEffect(() => {
    const token = localStorage.getItem('authToken');
    if (!token) {
      navigate('/login');
      return;
    }

    const fetchProjects = async () => {
      try {
        const res = await axiosClient.get('/student/projects');
        setProjects(res.data.data || []);
      } catch (err) {
        console.error("Error fetching projects:", err);
        if (err.response?.status === 401) navigate('/login');
      }
    };

    fetchProjects();
  }, [navigate]);

  useEffect(() => {
    setCurrentPage(1);
  }, [searchTerm]);

  // Filter projects by Title, Authors, Keywords
  const filteredProjects = projects.filter(project => {
    const title = project.Title?.toLowerCase() || '';
    const authors = project.Authors?.toLowerCase() || '';
    const keywords = project.Keywords?.toLowerCase() || '';
    return (
      title.includes(searchTerm.toLowerCase()) ||
      authors.includes(searchTerm.toLowerCase()) ||
      keywords.includes(searchTerm.toLowerCase())
    );
  });

  const projectsPerPage = 6;
  const totalPages = Math.ceil(filteredProjects.length / projectsPerPage);
  const startIndex = (currentPage - 1) * projectsPerPage;
  const paginatedProjects = filteredProjects.slice(startIndex, startIndex + projectsPerPage);

  const viewProject = (id) => navigate(`/abstract/${id}`);
  const goBack = () => navigate(-1);
  const goToPreviousPage = () => { if (currentPage > 1) setCurrentPage(currentPage - 1); };
  const goToNextPage = () => { if (currentPage < totalPages) setCurrentPage(currentPage + 1); };
  const resetFilters = () => { setSearchTerm(''); setCurrentPage(1); };

  return (
    <div className="app-container">
      <AppHeader title="Student Projects" />
      <div className="dashboard-container">

        {/* Search & Back Button */}
        <div className="dashboard-header">
          <div className="search-bar">
            <input
              type="text"
              placeholder="Search projects..."
              value={searchTerm}
              onChange={(e) => setSearchTerm(e.target.value)}
            />
          </div>
          <div className="back-button">
            <button className="btn btn-primary" onClick={goBack}>⬅ Back</button>
            <button className="btn btn-secondary" onClick={resetFilters}>Reset</button>
          </div>
        </div>

        <div className="dashboard-content">

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

export default StudentViewDocs;
