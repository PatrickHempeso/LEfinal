import React, { useEffect, useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import AppHeader from '../components/AppHeader';
import GuestNotice from '../components/GuestNotice';
import UniversityFooter from '../components/UniversityFooter';
import axiosClient from '../services/axiosClient'; // assuming you have axiosClient setup

function ProjectAbstract({ guestMode }) {
  const { id } = useParams();
  const [project, setProject] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    axiosClient.get(`/guest/document/${id}`)
      .then(res => {
        if (res.data.status === 'success') {
          setProject(res.data.data);
        } else {
          setError("Project not found");
        }
      })
      .catch(err => {
        console.error(err);
        setError("Error fetching project");
      })
      .finally(() => setLoading(false));
  }, [id]);

  if (loading) return <p>Loading abstract...</p>;
  if (error) return <p>{error}</p>;

  return (
    <div className="app-container">
      <AppHeader title="PROJECT ABSTRACT" />

      <div className="app-body">
        <GuestNotice guestMode={guestMode} />

        <div className="abstract-container">
          <h2>{project.Title}</h2>
          <p><strong>Authors:</strong> {project.Authors}</p>
          <p><strong>Keywords:</strong> {project.Keywords}</p>
          <p><strong>Year Published:</strong> {project.YearPublished}</p>
          <hr />
          <p>{project.Abstract || "No abstract available."}</p>
        </div>

        <div className="back-link">
          <Link 
            to={guestMode ? "/guest-dashboard" : "/projects"} 
            className="btn btn-secondary"
          >
            Back to Projects
          </Link>
        </div>
      </div>

      <UniversityFooter />
    </div>
  );
}

export default ProjectAbstract;
