import React from 'react';
import { Link } from 'react-router-dom';

function GuestNotice({ guestMode }) {
  if (!guestMode) return null;

  return (
    <div className="guest-notice">
      <span>You are browsing as a guest</span>
      <Link to="/login" className="btn btn-small">
        Login to Access More Features
      </Link>
    </div>
  );
}

export default GuestNotice;