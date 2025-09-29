
// +JUNTOS
// Ficheiro: apps/admin/src/services/api.ts
// Descrição: Cliente de API para o backend
// Autor: (+JUNTOS team)
// Locale: pt_PT

import axios from 'axios';

const apiClient = axios.create({
  baseURL: import.meta.env.VITE_API_URL || 'http://localhost:8080/v1',
  headers: {
    'Content-Type': 'application/json',
  },
});

// Add a request interceptor to add the auth token
apiClient.interceptors.request.use(async (config) => {
  // const token = await getAuthToken(); // Implement this
  // if (token) {
  //   config.headers.Authorization = `Bearer ${token}`;
  // }
  return config;
});

export default apiClient;
