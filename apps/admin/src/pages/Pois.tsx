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
    Stack,
    TextField,
    Typography
} from '@mui/material';
import { DataGrid, GridActionsCellItem, GridColDef, GridPaginationModel } from '@mui/x-data-grid';
import { keepPreviousData, useMutation, useQuery, useQueryClient } from '@tanstack/react-query';
import { AxiosResponse } from 'axios';
import { useState } from 'react';
import PoiForm from '../components/PoiForm';
import { PaginatedResult, Poi, poisApi } from '../services/api';

const columns = (handleView: (id: number) => void, handleEdit: (id: number) => void, handleDelete: (id: number) => void): GridColDef[] => [
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

export default function Pois() {
  const queryClient = useQueryClient();
  const [formOpen, setFormOpen] = useState(false);
  const [editingPoi, setEditingPoi] = useState<Poi | null>(null);
  const [snackbar, setSnackbar] = useState<{ open: boolean; message: string; severity: 'success' | 'error' }>({
    open: false,
    message: '',
    severity: 'success',
  });

  // Server-side pagination state
  const [paginationModel, setPaginationModel] = useState<GridPaginationModel>({
    page: 0,
    pageSize: 25,
  });

  const [search, setSearch] = useState<string>('');
  const [categoriaFilter, setCategoriaFilter] = useState<string>('');
  const [idadeMinFilter, setIdadeMinFilter] = useState<number | ''>('');
  const [idadeMaxFilter, setIdadeMaxFilter] = useState<number | ''>('');
  const [latFilter, setLatFilter] = useState<number | ''>('');
  const [lngFilter, setLngFilter] = useState<number | ''>('');
  const [raioFilter, setRaioFilter] = useState<number | ''>('');

  const { data, isLoading, error } = useQuery({
    queryKey: ['pois', 'paginated', paginationModel.page, paginationModel.pageSize, search, categoriaFilter, idadeMinFilter, idadeMaxFilter, latFilter, lngFilter, raioFilter],
    queryFn: () => poisApi.getPaginated(
      paginationModel.page,
      paginationModel.pageSize,
      search,
      categoriaFilter,
      idadeMinFilter === '' ? undefined : (idadeMinFilter as number),
      idadeMaxFilter === '' ? undefined : (idadeMaxFilter as number),
      latFilter === '' ? undefined : (latFilter as number),
      lngFilter === '' ? undefined : (lngFilter as number),
      raioFilter === '' ? undefined : (raioFilter as number)
    ).then((res: AxiosResponse<PaginatedResult<Poi>>) => res.data),
    placeholderData: keepPreviousData,
  });

  const pois = data?.items || [];
  const total = data?.total ?? 0;

  const deleteMutation = useMutation({
    mutationFn: (id: number) => poisApi.delete(id),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['pois', 'paginated'] });
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

  const handleEdit = (id: number) => {
    const poi = pois.find((p: Poi) => p.id === id);
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
      <Box sx={{ display: 'flex' }}>
        <Typography variant="h4" component="h1" sx={{ flexGrow: 1 }}>
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

      <Stack direction="row" spacing={2} sx={{ mb: 2, mt: 3 }}>
        <TextField label="Pesquisar" variant="outlined" size="small" value={search} onChange={e => setSearch(e.target.value)} />
        <TextField label="Categoria" variant="outlined" size="small" value={categoriaFilter} onChange={e => setCategoriaFilter(e.target.value)} />
        <TextField label="Idade Mín" variant="outlined" size="small" type="number" value={idadeMinFilter} onChange={e => setIdadeMinFilter(e.target.value === '' ? '' : Number(e.target.value))} />
        <TextField label="Idade Máx" variant="outlined" size="small" type="number" value={idadeMaxFilter} onChange={e => setIdadeMaxFilter(e.target.value === '' ? '' : Number(e.target.value))} />
        <TextField label="Lat" variant="outlined" size="small" type="number" value={latFilter} onChange={e => setLatFilter(e.target.value === '' ? '' : Number(e.target.value))} />
        <TextField label="Lng" variant="outlined" size="small" type="number" value={lngFilter} onChange={e => setLngFilter(e.target.value === '' ? '' : Number(e.target.value))} />
        <TextField label="Raio(m)" variant="outlined" size="small" type="number" value={raioFilter} onChange={e => setRaioFilter(e.target.value === '' ? '' : Number(e.target.value))} />
      </Stack>

      <Paper sx={{ height: 600, width: '100%' }}>
        <DataGrid
          rows={pois}
          columns={columns(handleView, handleEdit, handleDelete)}
          loading={isLoading}
          paginationMode="server"
          rowCount={total}
          pageSizeOptions={[25, 50, 100]}
          paginationModel={paginationModel}
          onPaginationModelChange={setPaginationModel}
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
        onClose={() => setSnackbar((prev: { open: boolean; message: string; severity: 'success' | 'error' }) => ({ ...prev, open: false }))}
      >
        <Alert
          onClose={() => setSnackbar((prev: { open: boolean; message: string; severity: 'success' | 'error' }) => ({ ...prev, open: false }))}
          severity={snackbar.severity}
          sx={{ width: '100%' }}
        >
          {snackbar.message}
        </Alert>
      </Snackbar>
    </Box>
  );
}
