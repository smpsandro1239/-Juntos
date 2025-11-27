// +JUNTOS
// Ficheiro: src/App.tsx
// Descrição: Aplicação principal Admin React
// Autor: (+JUNTOS team)
// Locale: pt_PT

import { CssBaseline } from '@mui/material';
import { ptPT } from '@mui/material/locale';
import { ThemeProvider, createTheme } from '@mui/material/styles';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { Route, BrowserRouter as Router, Routes } from 'react-router-dom';

import Layout from './components/Layout';
import RequireAuth from './components/RequireAuth';
import Dashboard from './pages/Dashboard';
import Events from './pages/Events';
import LoginPage from './pages/LoginPage';
import Pois from './pages/Pois';
import Users from './pages/Users';

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      retry: 1,
      refetchOnWindowFocus: false,
    },
  },
});

const theme = createTheme(
  {
    palette: {
      mode: 'light',
      primary: {
        main: '#2E7D32',
      },
      secondary: {
        main: '#FF6F00',
      },
    },
    typography: {
      fontFamily: 'Inter, sans-serif',
    },
  },
  ptPT
);

function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <ThemeProvider theme={theme}>
        <CssBaseline />
        <Router>
          <Routes>
            <Route path="/login" element={<LoginPage />} />

            <Route element={<RequireAuth><Layout /></RequireAuth>}>
              <Route path="/" element={<Dashboard />} />
              <Route path="/pois" element={<Pois />} />
              <Route path="/events" element={<Events />} />
              <Route path="/users" element={<Users />} />
            </Route>
          </Routes>
        </Router>
      </ThemeProvider>
    </QueryClientProvider>
  );
}

export default App;
