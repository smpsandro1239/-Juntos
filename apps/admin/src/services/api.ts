// +JUNTOS
// Ficheiro: src/services/api.ts
// Descrição: Cliente API para comunicação com backend
// Autor: (+JUNTOS team)
// Locale: pt_PT

import axios from 'axios';

const API_BASE_URL = import.meta.env.VITE_API_URL || 'http://localhost:8080/v1';

export const apiClient = axios.create({
  baseURL: API_BASE_URL,
  timeout: 10000,
  headers: {
    'Content-Type': 'application/json',
  },
});

// Interceptor para adicionar token de autenticação
apiClient.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('authToken');
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => {
    return Promise.reject(error);
  }
);

// Interceptor para tratar respostas e erros
apiClient.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response?.status === 401) {
      // Token expirado ou inválido
      localStorage.removeItem('authToken');
      window.location.href = '/login';
    }
    return Promise.reject(error);
  }
);

// Tipos para as APIs
export interface Poi {
  id?: number;
  nome: string;
  descricao: string;
  categoria: string;
  idadeMin: number;
  idadeMax: number;
  precoMin: number;
  precoMax: number;
  latitude: number;
  longitude: number;
  morada: string;
  codigoPostal: string;
  cidade: string;
  distrito: string;
  telefone?: string;
  website?: string;
  email?: string;
  acessibilidade: boolean;
  estacionamento: boolean;
  wc: boolean;
  interior: boolean;
  exterior: boolean;
  ativo: boolean;
}

export interface Event {
  id?: number;
  nome: string;
  descricao: string;
  categoria: string;
  idadeMin: number;
  idadeMax: number;
  preco: number;
  dataInicio: string;
  dataFim: string;
  latitude: number;
  longitude: number;
  morada: string;
  cidade: string;
  distrito: string;
  lotacaoMaxima?: number;
  reservaObrigatoria: boolean;
  urlReserva?: string;
  ativo: boolean;
}

// Funções da API
export const poisApi = {
  getAll: () => apiClient.get<Poi[]>('/pois'),
  getById: (id: number) => apiClient.get<Poi>(`/pois/${id}`),
  create: (poi: Omit<Poi, 'id'>) => apiClient.post<Poi>('/pois', poi),
  update: (id: number, poi: Partial<Poi>) => apiClient.put<Poi>(`/pois/${id}`, poi),
  delete: (id: number) => apiClient.delete(`/pois/${id}`),
  search: (query: string) => apiClient.get<Poi[]>(`/pois/search?q=${encodeURIComponent(query)}`),
};

export const eventsApi = {
  getAll: () => apiClient.get<Event[]>('/events'),
  getById: (id: number) => apiClient.get<Event>(`/events/${id}`),
  create: (event: Omit<Event, 'id'>) => apiClient.post<Event>('/events', event),
  update: (id: number, event: Partial<Event>) => apiClient.put<Event>(`/events/${id}`, event),
  delete: (id: number) => apiClient.delete(`/events/${id}`),
};