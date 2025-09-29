// +JUNTOS
// Ficheiro: src/pages/Pois.tsx
// Descrição: Página de gestão de POIs
// Autor: (+JUNTOS team)
// Locale: pt_PT

import React from 'react';
import {
  Box,
  Typography,
  Button,
  Paper,
} from '@mui/material';
import { DataGrid, GridColDef, GridActionsCellItem } from '@mui/x-data-grid';
import { Add, Edit, Delete, Visibility } from '@mui/icons-material';
import { useQuery } from '@tanstack/react-query';
import { apiClient } from '../services/api';

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
  // TODO: Implementar visualização
};

const handleEdit = (id: number) => {
  console.log('Editar POI:', id);
  // TODO: Implementar edição
};

const handleDelete = (id: number) => {
  console.log('Eliminar POI:', id);
  // TODO: Implementar eliminação
};

export default function Pois() {
  const { data: pois = [], isLoading, error } = useQuery({
    queryKey: ['pois'],
    queryFn: () => apiClient.get<Poi[]>('/pois').then(res => res.data),
  });

  if (error) {
    return (
      <Box>
        <Typography color="error">
          Erro ao carregar POIs: {(error as Error).message}
        </Typography>
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
          onClick={() => console.log('Adicionar POI')}
        >
          Adicionar POI
        </Button>
      </Box>

      <Paper sx={{ height: 600, width: '100%' }}>
        <DataGrid
          rows={pois}
          columns={columns}
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
            footerRowSelected: (count) =>
              count !== 1
                ? `${count.toLocaleString()} linhas selecionadas`
                : `${count.toLocaleString()} linha selecionada`,
          }}
        />
      </Paper>
    </Box>
  );
}