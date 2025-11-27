// +JUNTOS
// Ficheiro: src/components/Layout.tsx
// Descrição: Layout principal com Header e Sidebar
// Autor: (+JUNTOS team)
// Locale: pt_PT

import { AppBar, Box, CssBaseline, Toolbar, Typography } from '@mui/material';
import { Outlet } from 'react-router-dom';
import Sidebar from './Sidebar';

export default function Layout() {
  return (
    <Box sx={{ display: 'flex' }}>
      <CssBaseline />
      <AppBar position="fixed" sx={{ zIndex: (theme) => theme.zIndex.drawer + 1 }}>
        <Toolbar>
          <Typography variant="h6" noWrap component="div">
            +JUNTOS Admin
          </Typography>
        </Toolbar>
      </AppBar>
      <Sidebar />
      <Box component="main" sx={{ flexGrow: 1, p: 3 }}>
        <Toolbar />
        <Outlet />
      </Box>
    </Box>
  );
}
