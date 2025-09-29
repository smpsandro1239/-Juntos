
// +JUNTOS
// Ficheiro: apps/admin/src/pages/Pois.tsx
// Descrição: Página para gestão de POIs
// Autor: (+JUNTOS team)
// Locale: pt_PT

import { DataGrid, GridColDef } from '@mui/x-data-grid';

const columns: GridColDef[] = [
  { field: 'id', headerName: 'ID', width: 300 },
  { field: 'name', headerName: 'Nome', width: 250 },
  { field: 'city', headerName: 'Cidade', width: 150 },
  { field: 'updatedAt', headerName: 'Atualizado em', width: 200, type: 'dateTime' },
];

// Mock data for now
const rows = [
  { id: 'uuid-1', name: 'Parque das Nações', city: 'Lisboa', updatedAt: new Date() },
  { id: 'uuid-2', name: 'Serralves', city: 'Porto', updatedAt: new Date() },
];

export default function Pois() {
  return (
    <div style={{ height: 400, width: '100%' }}>
      <DataGrid
        rows={rows}
        columns={columns}
        pageSizeOptions={[5, 10]}
        checkboxSelection
      />
    </div>
  );
}
