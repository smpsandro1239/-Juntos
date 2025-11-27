// +JUNTOS
// Ficheiro: src/pages/Dashboard.tsx
// Descrição: Dashboard principal
// Autor: (+JUNTOS team)
// Locale: pt_PT

import { Grid, Paper, Typography } from '@mui/material';

export default function Dashboard() {
  return (
    <Grid container spacing={3}>
      <Grid item xs={12}>
        <Paper sx={{ p: 2 }}>
          <Typography variant="h4" gutterBottom>
            Bem-vindo ao +JUNTOS Admin
          </Typography>
          <Typography variant="body1">
            Selecione uma opção no menu lateral para gerir a plataforma.
          </Typography>
        </Paper>
      </Grid>
    </Grid>
  );
}
