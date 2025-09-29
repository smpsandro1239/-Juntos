// +JUNTOS
// Ficheiro: src/App.tsx
// Descrição: Aplicação principal Admin React
// Autor: (+JUNTOS team)
// Locale: pt_PT

import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import { QueryClient, QueryClientProvider } from '@tanstack/react-query';
import { ThemeProvider, createTheme } from '@mui/material/styles';
import { CssBaseline, Box } from '@mui/material';
import { ptPT } from '@mui/material/locale';

import Sidebar from './components/Sidebar';
import Pois from './pages/Pois';
import Events from './pages/Events';
import Users from './pages/Users';
import Dashboard from './pages/Dashboard';

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
          <Box sx={{ display: 'flex' }}>
            <Sidebar />
            <Box component="main" sx={{ flexGrow: 1, p: 3 }}>
              <Routes>
                <Route path="/" element={<Dashboard />} />
                <Route path="/pois" element={<Pois />} />
                <Route path="/events" element={<Events />} />
                <Route path="/users" element={<Users />} />
              </Routes>
            </Box>
          </Box>
        </Router>
      </ThemeProvider>
    </QueryClientProvider>
  );
}

export default App;