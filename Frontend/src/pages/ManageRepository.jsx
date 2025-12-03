import React, { useState, useEffect } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import AppHeader from '../components/AppHeader';

function ManageRepository() {
  const [projects, setProjects] = useState([
    { id: 1, title: "BSIT-BTM 1", type: "Undergraduate - BSIT-BTM", author: "John Doe", date: "2023-05-15" },
    { id: 2, title: "BSIT-BTM 2", type: "Undergraduate - BSIT-BTM", author: "Jane Smith", date: "2023-06-20" },
    { id: 3, title: "MIT 1", type: "Postgraduate - MIT", author: "Robert Johnson", date: "2023-04-10" },
    { id: 4, title: "BSIT-IS 1", type: "Undergraduate - BSIT-IS", author: "Maria Garcia", date: "2023-07-05" },
    { id: 5, title: "BSCS 1", type: "Undergraduate - BSCS", author: "David Lee", date: "2023-03-22" },
    { id: 6, title: "MLIS 1", type: "Postgraduate - MLIS", author: "Sarah Williams", date: "2023-08-12" },
    { id: 7, title: "DIT 1", type: "Postgraduate - DIT", author: "Michael Brown", date: "2023-09-01" }
  ]);

  const [newProject, setNewProject] = useState({
    title: '',
    type: '',
    author: ''
  });

  const [currentPage, setCurrentPage] = useState(1);
  const itemsPerPage = 5;
  const navigate = useNavigate();

  // Calculate paginated projects
  const startIndex = (currentPage - 1) * itemsPerPage;
  const endIndex = startIndex + itemsPerPage;
  const paginatedProjects = projects.slice(startIndex, endIndex);
  const totalPages = Math.ceil(projects.length / itemsPerPage);

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setNewProject(prev => ({
      ...prev,
      [name]: value
    }));
  };

  const handleAddProject = (e) => {
    e.preventDefault();
    
    if (newProject.title && newProject.type && newProject.author) {
      const project = {
        id: projects.length + 1,
        title: newProject.title,
        type: newProject.type,
        author: newProject.author,
        date: new Date().toISOString().split('T')[0]
      };
      
      setProjects(prev => [project, ...prev]);
      setNewProject({ title: '', type: '', author: '' });
      setCurrentPage(1); // Reset to first page when adding new project
    }
  };

  const deleteProject = (index) => {
    if (window.confirm("Are you sure you want to delete this project?")) {
      const actualIndex = startIndex + index;
      setProjects(prev => prev.filter((_, i) => i !== actualIndex));
      
      // Adjust current page if needed
      const newTotalPages = Math.ceil((projects.length - 1) / itemsPerPage);
      if (currentPage > newTotalPages) {
        setCurrentPage(newTotalPages || 1);
      }
    }
  };

  const handleLogout = () => {
    localStorage.removeItem('isLoggedIn');
    localStorage.removeItem('userRole');
    navigate('/login');
  };

  const goToPage = (page) => {
    setCurrentPage(page);
  };

  const goToPreviousPage = () => {
    if (currentPage > 1) {
      setCurrentPage(currentPage - 1);
    }
  };

  const goToNextPage = () => {
    if (currentPage < totalPages) {
      setCurrentPage(currentPage + 1);
    }
  };

  return (
    <div className="app-container">
      <AppHeader title="Manage Repository" />
      
      <div className="dashboard-container">
        <div className="dashboard-header">
          <div className="user-actions">
            <Link to="/dashboard/faculty" className="btn btn-secondary">← Dashboard</Link>
            <button onClick={handleLogout} className="btn btn-logout">Logout</button>
          </div>
        </div>

        <div className="dashboard-content">
          <h2 className="section-title">Existing Projects</h2>
          <div id="projectsContainer">
            {paginatedProjects.map((project, index) => (
              <div key={project.id} className="project-card">
                <h3>{project.title}</h3>
                <p>Type: {project.type}</p>
                <p>Author: {project.author}</p>
                <p>Date: {project.date}</p>
                <button 
                  className="delete-btn" 
                  onClick={() => deleteProject(index)}
                >
                  Delete
                </button>
              </div>
            ))}
          </div>

          {/* Pagination Controls */}
          <div id="pagination" className="pagination-controls">
            <button 
              onClick={goToPreviousPage}
              disabled={currentPage === 1}
            >
              Previous
            </button>
            
            {Array.from({ length: totalPages }, (_, i) => i + 1).map(page => (
              <button
                key={page}
                onClick={() => goToPage(page)}
                disabled={page === currentPage}
                className={page === currentPage ? 'active' : ''}
              >
                {page}
              </button>
            ))}
            
            <button 
              onClick={goToNextPage}
              disabled={currentPage === totalPages}
            >
              Next
            </button>
          </div>

          <div className="form-section">
            <h3>Add New Project</h3>
            <form id="addProjectForm" onSubmit={handleAddProject}>
              <div className="form-group">
                <label htmlFor="title">Project Title</label>
                <input 
                  type="text" 
                  id="title"
                  name="title"
                  value={newProject.title}
                  onChange={handleInputChange}
                  required 
                />
              </div>
              <div className="form-group">
                <label htmlFor="type">Project Type</label>
                <input 
                  type="text" 
                  id="type"
                  name="type"
                  value={newProject.type}
                  onChange={handleInputChange}
                  required 
                />
              </div>
              <div className="form-group">
                <label htmlFor="author">Author</label>
                <input 
                  type="text" 
                  id="author"
                  name="author"
                  value={newProject.author}
                  onChange={handleInputChange}
                  required 
                />
              </div>
              <button type="submit" className="btn-submit">Add Project</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  );
}

export default ManageRepository;