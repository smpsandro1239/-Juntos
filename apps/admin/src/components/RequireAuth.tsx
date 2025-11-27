// +JUNTOS
// Ficheiro: src/components/RequireAuth.tsx
// Descrição: Proteção de rotas que requerem autenticação
// Autor: (+JUNTOS team)
// Locale: pt_PT

import { Navigate, useLocation } from 'react-router-dom';

export default function RequireAuth({ children }: { children: JSX.Element }) {
  const token = localStorage.getItem('authToken');
  const location = useLocation();

  if (!token) {
    return <Navigate to="/login" state={{ from: location }} replace />;
  }

  return children;
}
