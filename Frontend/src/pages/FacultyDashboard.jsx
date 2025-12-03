import React, { useState, useEffect } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import AppHeader from '../components/AppHeader';
import axiosClient from '../services/axiosClient';
import '../assets/design.css';

function FacultyDashboard() {
  const [facultyInfo, setFacultyInfo] = useState({});
  const [documents, setDocuments] = useState([]);
  const [searchTerm, setSearchTerm] = useState('');
  const [currentPage, setCurrentPage] = useState(1);
  const [modalDoc, setModalDoc] = useState(null);
  const navigate = useNavigate();

  const documentsPerPage = 6;

  // Fetch faculty info and documents
  useEffect(() => {
    const token = localStorage.getItem('authToken');
    if (!token) {
      navigate('/login');
      return;
    }

    const fetchData = async () => {
      try {
        const resDash = await axiosClient.get('/api/faculty/dashboard', {
          headers: { Authorization: `Bearer ${token}` },
        });
        setFacultyInfo(resDash.data.faculty);

        const resDocuments = await axiosClient.get('/api/faculty/documents', {
          headers: { Authorization: `Bearer ${token}` },
        });

        console.log("Fetched documents:", resDocuments.data); // Debug
        setDocuments(resDocuments.data.data || []);
      } catch (err) {
        console.error("Error fetching documents:", err);
        if (err.response?.status === 401) navigate('/login');
      }
    };

    fetchData();
  }, [navigate]);

  useEffect(() => setCurrentPage(1), [searchTerm]);

  // Filter documents
  const filteredDocuments = documents.filter(doc => {
    const title = doc.Title?.toLowerCase() || '';
    const authors = doc.Authors?.toLowerCase() || '';
    const keywords = doc.Keywords?.toLowerCase() || '';
    return (
      title.includes(searchTerm.toLowerCase()) ||
      authors.includes(searchTerm.toLowerCase()) ||
      keywords.includes(searchTerm.toLowerCase())
    );
  });

  // Pagination
  const totalPages = Math.ceil(filteredDocuments.length / documentsPerPage);
  const startIndex = (currentPage - 1) * documentsPerPage;
  const paginatedDocuments = filteredDocuments.slice(startIndex, startIndex + documentsPerPage);

  const openModal = (doc) => setModalDoc(doc);
  const closeModal = () => setModalDoc(null);

  return (
    <div className="app-container">
      <AppHeader title={`Welcome, ${facultyInfo.firstName || ''}`} />

      <div className="dashboard-container">
        <div className="dashboard-header">
          <input
            type="text"
            placeholder="Search documents..."
            value={searchTerm}
            onChange={(e) => setSearchTerm(e.target.value)}
          />
          <button className="btn btn-logout" onClick={() => { localStorage.clear(); navigate('/login'); }}>
            Logout
          </button>
        </div>

        <h2>Documents</h2>
        <div className="projects-grid">
          {paginatedDocuments.map(doc => (
            <div key={doc.DocumentID} className="project-card">
              <div className="project-badge">📄</div>
              <h3>{doc.Title}</h3>
              <p className="author">By: {doc.Authors}</p>
              <p className="date">Published: {doc.YearPublished}</p>
              <div className="project-excerpt">{doc.Keywords}</div>
              <div className="actions">
                <button className="btn btn-view" onClick={() => openModal(doc)}>View Abstract</button>
              </div>
            </div>
          ))}
          {filteredDocuments.length === 0 && (
            <p style={{ gridColumn: '1 / -1', textAlign: 'center' }}>No documents found.</p>
          )}
        </div>

        {totalPages > 1 && (
          <div className="pagination">
            <button className="btn btn-secondary" onClick={() => setCurrentPage(prev => Math.max(prev - 1, 1))} disabled={currentPage === 1}>Previous</button>
            <span>Page {currentPage} of {totalPages}</span>
            <button className="btn btn-secondary" onClick={() => setCurrentPage(prev => Math.min(prev + 1, totalPages))} disabled={currentPage === totalPages}>Next</button>
          </div>
        )}

        <div style={{ marginTop: '20px', textAlign: 'center' }}>
          <Link to="/faculty/submit" className="btn btn-primary">Submit New Project</Link>
        </div>
      </div>

      {modalDoc && (
        <div className="modal-overlay" onClick={closeModal}>
          <div className="modal-content" onClick={e => e.stopPropagation()}>
            <h2>{modalDoc.Title}</h2>
            <p><strong>Authors:</strong> {modalDoc.Authors}</p>
            <p><strong>Published:</strong> {modalDoc.YearPublished}</p>
            <p><strong>Keywords:</strong> {modalDoc.Keywords}</p>
            <hr />
            <p>{modalDoc.Abstract}</p>
            <button className="btn btn-close" onClick={closeModal}>Close</button>
          </div>
        </div>
      )}
    </div>
  );
}

export default FacultyDashboard;
