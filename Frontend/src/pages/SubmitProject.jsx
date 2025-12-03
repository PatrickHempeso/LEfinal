import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import '../assets/design.css';

function SubmitProject() {
  const [formData, setFormData] = useState({
    title: '',
    type: '',
    abstract: '',
    keywords: '',
    adviser: '',
    yearPublished: new Date().getFullYear(),
  });

  const [students, setStudents] = useState([
    { firstName: '', lastName: '', program: 'BSIT', programType: 'College' }
  ]);

  const [errors, setErrors] = useState({});
  const navigate = useNavigate();

  // Handle main form
  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData(prev => ({ ...prev, [name]: value }));
    if (errors[name]) setErrors(prev => ({ ...prev, [name]: '' }));
  };

  // Handle student fields
  const handleStudentChange = (index, field, value) => {
    const updated = [...students];
    updated[index][field] = value;
    setStudents(updated);
  };

  const addStudent = () =>
    setStudents(prev => [...prev, { firstName: '', lastName: '', program: 'BSIT', programType: 'College' }]);

  const removeStudent = (index) =>
    setStudents(prev => prev.length > 1 ? prev.filter((_, i) => i !== index) : prev);

  // Validation
  const validateForm = () => {
    const newErrors = {};
    if (!formData.title.trim()) newErrors.title = 'Title required';
    if (!formData.type) newErrors.type = 'Select type';
    if (!formData.abstract.trim()) newErrors.abstract = 'Abstract required';
    if (!formData.keywords.trim()) newErrors.keywords = 'Keywords required';

    students.forEach((s, i) => {
      if (!s.firstName.trim()) newErrors[`student-${i}-first`] = 'First name required';
      if (!s.lastName.trim()) newErrors[`student-${i}-last`] = 'Last name required';
    });

    setErrors(newErrors);
    return Object.keys(newErrors).length === 0;
  };

  // Handle submit
  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!validateForm()) return;

    const payload = {
      title: formData.title,
      type: formData.type,
      abstract: formData.abstract,
      keywords: formData.keywords,
      adviser: formData.adviser,
      yearPublished: formData.yearPublished,
      students: students.map(s => ({
        firstName: s.firstName,
        lastName: s.lastName,
        program: s.program,
        programType: s.programType
      }))
    };

    console.log('Submitting payload:', payload); // <-- Log payload for debugging

    try {
      const res = await fetch('/api/student/project/submit', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${localStorage.getItem('authToken')}`
        },
        body: JSON.stringify(payload)
      });

      const data = await res.json();

      console.log('Server response:', data); // <-- Log server response

      if (res.ok) {
        alert(`Project submitted! DocumentID: ${data.documentId}`);
        navigate('/dashboard/student');
      } else {
        alert(data.error || 'Submission failed');
      }
    } catch (err) {
      console.error('Submission error:', err); // <-- Log errors
      alert('Server error');
    }
  };

  return (
    <div className="app-container">
      <div className="registration-form">
        <h2>Submit Project</h2>
        <form onSubmit={handleSubmit}>

          {/* Project Info */}
          <div className="form-group">
            <label>Title *</label>
            <input name="title" value={formData.title} onChange={handleChange} />
            {errors.title && <span className="text-danger">{errors.title}</span>}
          </div>

          <div className="form-group">
            <label>Type *</label>
            <select name="type" value={formData.type} onChange={handleChange}>
              <option value="">Select type</option>
              <option value="Capstone">Capstone</option>
              <option value="Thesis">Thesis</option>
            </select>
            {errors.type && <span className="text-danger">{errors.type}</span>}
          </div>

          {/* Student Authors */}
          {students.map((s, i) => (
            <div key={i} className="form-group" style={{ border: '1px solid #eee', padding: '15px', borderRadius: '8px', marginBottom: '15px' }}>
              <h4>Student {i + 1}</h4>

              <input
                placeholder="First Name"
                value={s.firstName}
                onChange={e => handleStudentChange(i, 'firstName', e.target.value)}
              />
              {errors[`student-${i}-first`] && <span className="text-danger">{errors[`student-${i}-first`]}</span>}

              <input
                placeholder="Last Name"
                value={s.lastName}
                onChange={e => handleStudentChange(i, 'lastName', e.target.value)}
              />
              {errors[`student-${i}-last`] && <span className="text-danger">{errors[`student-${i}-last`]}</span>}

              {students.length > 1 && (
                <button type="button" className="btn btn-danger" onClick={() => removeStudent(i)}>
                  Remove
                </button>
              )}
            </div>
          ))}

          <button type="button" className="btn btn-secondary" onClick={addStudent}>Add Student</button>

          {/* Abstract */}
          <div className="form-group">
            <label>Abstract *</label>
            <textarea name="abstract" value={formData.abstract} onChange={handleChange} />
            {errors.abstract && <span className="text-danger">{errors.abstract}</span>}
          </div>

          {/* Keywords */}
          <div className="form-group">
            <label>Keywords *</label>
            <input name="keywords" value={formData.keywords} onChange={handleChange} />
            {errors.keywords && <span className="text-danger">{errors.keywords}</span>}
          </div>

          {/* Adviser */}
          <div className="form-group">
            <label>Adviser</label>
            <input name="adviser" value={formData.adviser} onChange={handleChange} />
          </div>

          <div className="form-actions" style={{ display: 'flex', gap: '10px', justifyContent: 'flex-start' }}>
            <button type="button" className="btn btn-secondary" onClick={() => navigate(-1)}>
              &larr; Back
            </button>
            <button type="submit" className="btn btn-primary">Submit Project</button>
          </div>

        </form>
      </div>
    </div>
  );
}

export default SubmitProject;
