// +JUNTOS
// Ficheiro: src/pages/Pois.tsx
// Descrição: Página de gestão de POIs
// Autor: (+JUNTOS team)
// Locale: pt_PT

import { Add, Delete, Edit, Visibility } from '@mui/icons-material';
import {
  Alert,
  Box,
  Button,
  Paper,
  Snackbar,
  Typography,
} from '@mui/material';
import { DataGrid, GridActionsCellItem, GridColDef } from '@mui/x-data-grid';
import { useMutation, useQuery, useQueryClient } from '@tanstack/react-query';
import { useState } from 'react';
import PoiForm from '../components/PoiForm';
import { poisApi } from '../services/api';

interface Poi {
  id: number;
  nome: string;
  categoria: string;
  cidade: string;
  distrito: string;
  precoMin: number;
  precoMax: number;
  ativo: boolean;
  criadoEm: string;
}

const columns: GridColDef[] = [
  { field: 'id', headerName: 'ID', width: 70 },
  { field: 'nome', headerName: 'Nome', width: 200 },
  { field: 'categoria', headerName: 'Categoria', width: 120 },
  { field: 'cidade', headerName: 'Cidade', width: 120 },
  { field: 'distrito', headerName: 'Distrito', width: 120 },
  {
    field: 'preco',
    headerName: 'Preço',
    width: 100,
    valueGetter: (params) => {
      const { precoMin, precoMax } = params.row;
      if (precoMin === 0 && precoMax === 0) return 'Grátis';
      if (precoMin === precoMax) return `${precoMin}€`;
      return `${precoMin}€ - ${precoMax}€`;
    },
  },
  {
    field: 'ativo',
    headerName: 'Estado',
    width: 100,
    type: 'boolean',
  },
  {
    field: 'actions',
    type: 'actions',
    headerName: 'Ações',
    width: 150,
    getActions: (params) => [
      <GridActionsCellItem
        key="view"
        icon={<Visibility />}
        label="Ver"
        onClick={() => handleView(params.id as number)}
      />,
      <GridActionsCellItem
        key="edit"
        icon={<Edit />}
        label="Editar"
        onClick={() => handleEdit(params.id as number)}
      />,
      <GridActionsCellItem
        key="delete"
        icon={<Delete />}
        label="Eliminar"
        onClick={() => handleDelete(params.id as number)}
      />,
    ],
  },
];

const handleView = (id: number) => {
  console.log('Ver POI:', id);
  // TODO: Implementar visualização detalhada
};

const handleEdit = (id: number, pois: Poi[]) => {
  const poi = pois.find(p => p.id === id);
  if (poi) {
    setEditingPoi(poi);
    setFormOpen(true);
  }
};

const handleDelete = (id: number) => {
  if (window.confirm('Tem certeza que deseja eliminar este POI?')) {
    deleteMutation.mutate(id);
  }
};

export default function Pois() {
  const queryClient = useQueryClient();
  const [formOpen, setFormOpen] = useState(false);
  const [editingPoi, setEditingPoi] = useState<Poi | null>(null);
  const [snackbar, setSnackbar] = useState<{ open: boolean; message: string; severity: 'success' | 'error' }>({
    open: false,
    message: '',
    severity: 'success',
  });

  const { data: pois = [], isLoading, error } = useQuery({
    queryKey: ['pois'],
    queryFn: () => poisApi.getAll().then(res => res.data),
  });

  const deleteMutation = useMutation({
    mutationFn: (id: number) => poisApi.delete(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['pois'] });
      setSnackbar({
        open: true,
        message: 'POI eliminado com sucesso!',
        severity: 'success',
      });
    },
    onError: () => {
      setSnackbar({
        open: true,
        message: 'Erro ao eliminar POI. Tente novamente.',
        severity: 'error',
      });
    },
  });

  const handleCreatePoi = () => {
    setEditingPoi(null);
    setFormOpen(true);
  };

  const handleCloseForm = () => {
    setFormOpen(false);
    setEditingPoi(null);
  };

  if (error) {
    return (
      <Box>
        <Alert severity="error" sx={{ mb: 2 }}>
          Erro ao carregar POIs: {(error as Error).message}
        </Alert>
      </Box>
    );
  }

  return (
    <Box>
      <Box sx={{ display: 'flex', justifyContent: 'space-between', mb: 3 }}>
        <Typography variant="h4" component="h1">
          Pontos de Interesse
        </Typography>
        <Button
          variant="contained"
          startIcon={<Add />}
          onClick={handleCreatePoi}
        >
          Adicionar POI
        </Button>
      </Box>

      <Paper sx={{ height: 600, width: '100%' }}>
        <DataGrid
          rows={pois}
          columns={columns.map(col => ({
            ...col,
            getActions: col.field === 'actions' ? (params: any) => [
              <GridActionsCellItem
                key="view"
                icon={<Visibility />}
                label="Ver"
                onClick={() => handleView(params.id as number)}
              />,
              <GridActionsCellItem
                key="edit"
                icon={<Edit />}
                label="Editar"
                onClick={() => handleEdit(params.id as number, pois)}
              />,
              <GridActionsCellItem
                key="delete"
                icon={<Delete />}
                label="Eliminar"
                onClick={() => handleDelete(params.id as number)}
              />,
            ] : undefined,
          }))}
          loading={isLoading}
          pageSizeOptions={[25, 50, 100]}
          initialState={{
            pagination: {
              paginationModel: { pageSize: 25 },
            },
          }}
          checkboxSelection
          disableRowSelectionOnClick
          localeText={{
            noRowsLabel: 'Nenhum POI encontrado',
            footerRowSelected: (count: any) =>
              count !== 1
                ? `${count.toLocaleString()} linhas selecionadas`
                : `${count.toLocaleString()} linha selecionada`,
          }}
        />
      </Paper>

      {/* Formulário de criação/edição */}
      <PoiForm
        open={formOpen}
        onClose={handleCloseForm}
        poi={editingPoi}
      />

      {/* Snackbar para feedback */}
      <Snackbar
        open={snackbar.open}
        autoHideDuration={4000}
        onClose={() => setSnackbar(prev => ({ ...prev, open: false }))}
      >
        <Alert
          onClose={() => setSnackbar(prev => ({ ...prev, open: false }))}
          severity={snackbar.severity}
          sx={{ width: '100%' }}
        >
          {snackbar.message}
        </Alert>
      </Snackbar>
    </Box>
  );
}
