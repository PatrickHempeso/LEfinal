import api from "./api";
import { getCsrfToken } from "./csrf";

// Login
export async function login(email, password) {
  await getCsrfToken();
  const response = await api.post("/login", { email, password });
  return response.data;
}

// Get current user
export async function getUser() {
  const response = await api.get("/user");
  return response.data;
}
