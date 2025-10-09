// +JUNTOS
// Ficheiro: src/components/PoiForm.tsx
// Descrição: Formulário para criação e edição de POIs
// Autor: (+JUNTOS team)
// Locale: pt_PT

import {
  Alert,
  Box,
  Button,
  CircularProgress,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  FormControl,
  FormControlLabel,
  Grid,
  InputLabel,
  MenuItem,
  Select,
  Switch,
  TextField,
} from '@mui/material';
import { useMutation, useQueryClient } from '@tanstack/react-query';
import React, { useEffect, useState } from 'react';
import { Poi, poisApi } from '../services/api';

interface PoiFormProps {
  open: boolean;
  onClose: () => void;
  poi?: Poi | null;
}

const CATEGORIAS = [
  'Parque', 'Museu', 'Praia', 'Trilho', 'Teatro', 'Biblioteca',
  'Jardim Zoológico', 'Aquário', 'Centro Ciência', 'Parque Aventura',
  'Piscina', 'Ginásio', 'Campo Desportivo', 'Centro Cultural'
];

const DISTRITOS = [
  'Aveiro', 'Beja', 'Braga', 'Bragança', 'Castelo Branco', 'Coimbra',
  'Évora', 'Faro', 'Guarda', 'Leiria', 'Lisboa', 'Portalegre',
  'Porto', 'Santarém', 'Setúbal', 'Viana do Castelo', 'Vila Real', 'Viseu'
];

const PoiForm: React.FC<PoiFormProps> = ({ open, onClose, poi }) => {
  const queryClient = useQueryClient();
  const isEditing = !!poi;

  const [formData, setFormData] = useState<Partial<Poi>>({
    nome: '',
    descricao: '',
    categoria: '',
    idadeMin: 0,
    idadeMax: 12,
    precoMin: 0,
    precoMax: 0,
    latitude: 38.7223, // Lisboa por padrão
    longitude: -9.1393,
    morada: '',
    codigoPostal: '',
    cidade: '',
    distrito: '',
    telefone: '',
    website: '',
    email: '',
    acessibilidade: false,
    estacionamento: false,
    wc: false,
    interior: false,
    exterior: true,
    ativo: true,
  });

  const [errors, setErrors] = useState<Record<string, string>>({});

  useEffect(() => {
    if (poi) {
      setFormData(poi);
    } else {
      // Reset form for new POI
      setFormData({
        nome: '',
        descricao: '',
        categoria: '',
        idadeMin: 0,
        idadeMax: 12,
        precoMin: 0,
        precoMax: 0,
        latitude: 38.7223,
        longitude: -9.1393,
        morada: '',
        codigoPostal: '',
        cidade: '',
        distrito: '',
        telefone: '',
        website: '',
        email: '',
        acessibilidade: false,
        estacionamento: false,
        wc: false,
        interior: false,
        exterior: true,
        ativo: true,
      });
    }
    setErrors({});
  }, [poi, open]);

  const createMutation = useMutation({
    mutationFn: (data: Omit<Poi, 'id'>) => poisApi.create(data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['pois'] });
      onClose();
    },
  });

  const updateMutation = useMutation({
    mutationFn: ({ id, data }: { id: number; data: Partial<Poi> }) =>
      poisApi.update(id, data),
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['pois'] });
      onClose();
    },
  });

  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();

    // Validação básica
    const newErrors: Record<string, string> = {};

    if (!formData.nome?.trim()) newErrors.nome = 'Nome é obrigatório';
    if (!formData.descricao?.trim()) newErrors.descricao = 'Descrição é obrigatória';
    if (!formData.categoria) newErrors.categoria = 'Categoria é obrigatória';
    if (!formData.morada?.trim()) newErrors.morada = 'Morada é obrigatória';
    if (!formData.cidade?.trim()) newErrors.cidade = 'Cidade é obrigatória';
    if (!formData.distrito) newErrors.distrito = 'Distrito é obrigatório';

    if (formData.idadeMin! > formData.idadeMax!) {
      newErrors.idadeMin = 'Idade mínima não pode ser maior que máxima';
    }

    if (formData.precoMin! > formData.precoMax!) {
      newErrors.precoMin = 'Preço mínimo não pode ser maior que máximo';
    }

    setErrors(newErrors);

    if (Object.keys(newErrors).length > 0) return;

    if (isEditing && poi?.id) {
      updateMutation.mutate({ id: poi.id, data: formData });
    } else {
      createMutation.mutate(formData as Omit<Poi, 'id'>);
    }
  };

  const handleChange = (field: keyof Poi, value: any) => {
    setFormData(prev => ({ ...prev, [field]: value }));
    if (errors[field]) {
      setErrors(prev => ({ ...prev, [field]: '' }));
    }
  };

  const isLoading = createMutation.isPending || updateMutation.isPending;

  return (
    <Dialog open={open} onClose={onClose} maxWidth="md" fullWidth>
      <form onSubmit={handleSubmit}>
        <DialogTitle>
          {isEditing ? 'Editar POI' : 'Criar Novo POI'}
        </DialogTitle>

        <DialogContent>
          {(createMutation.error || updateMutation.error) && (
            <Alert severity="error" sx={{ mb: 2 }}>
              Erro ao {isEditing ? 'atualizar' : 'criar'} POI. Tente novamente.
            </Alert>
          )}

          <Grid container spacing={2} sx={{ mt: 1 }}>
            {/* Informações Básicas */}
            <Grid item xs={12}>
              <TextField
                fullWidth
                label="Nome *"
                value={formData.nome || ''}
                onChange={(e) => handleChange('nome', e.target.value)}
                error={!!errors.nome}
                helperText={errors.nome}
                disabled={isLoading}
              />
            </Grid>

            <Grid item xs={12}>
              <TextField
                fullWidth
                multiline
                rows={3}
                label="Descrição *"
                value={formData.descricao || ''}
                onChange={(e) => handleChange('descricao', e.target.value)}
                error={!!errors.descricao}
                helperText={errors.descricao}
                disabled={isLoading}
              />
            </Grid>

            <Grid item xs={12} sm={6}>
              <FormControl fullWidth error={!!errors.categoria}>
                <InputLabel>Categoria *</InputLabel>
                <Select
                  value={formData.categoria || ''}
                  onChange={(e) => handleChange('categoria', e.target.value)}
                  disabled={isLoading}
                >
                  {CATEGORIAS.map((cat) => (
                    <MenuItem key={cat} value={cat}>{cat}</MenuItem>
                  ))}
                </Select>
              </FormControl>
            </Grid>

            {/* Faixa Etária */}
            <Grid item xs={6} sm={3}>
              <TextField
                fullWidth
                type="number"
                label="Idade Mínima"
                value={formData.idadeMin || 0}
                onChange={(e) => handleChange('idadeMin', parseInt(e.target.value) || 0)}
                error={!!errors.idadeMin}
                helperText={errors.idadeMin}
                disabled={isLoading}
                inputProps={{ min: 0, max: 18 }}
              />
            </Grid>

            <Grid item xs={6} sm={3}>
              <TextField
                fullWidth
                type="number"
                label="Idade Máxima"
                value={formData.idadeMax || 12}
                onChange={(e) => handleChange('idadeMax', parseInt(e.target.value) || 12)}
                disabled={isLoading}
                inputProps={{ min: 0, max: 18 }}
              />
            </Grid>

            {/* Preços */}
            <Grid item xs={6} sm={3}>
              <TextField
                fullWidth
                type="number"
                label="Preço Mínimo (€)"
                value={formData.precoMin || 0}
                onChange={(e) => handleChange('precoMin', parseFloat(e.target.value) || 0)}
                error={!!errors.precoMin}
                helperText={errors.precoMin}
                disabled={isLoading}
                inputProps={{ min: 0, step: 0.01 }}
              />
            </Grid>

            <Grid item xs={6} sm={3}>
              <TextField
                fullWidth
                type="number"
                label="Preço Máximo (€)"
                value={formData.precoMax || 0}
                onChange={(e) => handleChange('precoMax', parseFloat(e.target.value) || 0)}
                disabled={isLoading}
                inputProps={{ min: 0, step: 0.01 }}
              />
            </Grid>

            {/* Localização */}
            <Grid item xs={12}>
              <TextField
                fullWidth
                label="Morada *"
                value={formData.morada || ''}
                onChange={(e) => handleChange('morada', e.target.value)}
                error={!!errors.morada}
                helperText={errors.morada}
                disabled={isLoading}
              />
            </Grid>

            <Grid item xs={12} sm={4}>
              <TextField
                fullWidth
                label="Código Postal"
                value={formData.codigoPostal || ''}
                onChange={(e) => handleChange('codigoPostal', e.target.value)}
                disabled={isLoading}
              />
            </Grid>

            <Grid item xs={12} sm={4}>
              <TextField
                fullWidth
                label="Cidade *"
                value={formData.cidade || ''}
                onChange={(e) => handleChange('cidade', e.target.value)}
                error={!!errors.cidade}
                helperText={errors.cidade}
                disabled={isLoading}
              />
            </Grid>

            <Grid item xs={12} sm={4}>
              <FormControl fullWidth error={!!errors.distrito}>
                <InputLabel>Distrito *</InputLabel>
                <Select
                  value={formData.distrito || ''}
                  onChange={(e) => handleChange('distrito', e.target.value)}
                  disabled={isLoading}
                >
                  {DISTRITOS.map((dist) => (
                    <MenuItem key={dist} value={dist}>{dist}</MenuItem>
                  ))}
                </Select>
              </FormControl>
            </Grid>

            {/* Coordenadas */}
            <Grid item xs={6}>
              <TextField
                fullWidth
                type="number"
                label="Latitude"
                value={formData.latitude || 38.7223}
                onChange={(e) => handleChange('latitude', parseFloat(e.target.value) || 38.7223)}
                disabled={isLoading}
                inputProps={{ step: 0.000001 }}
              />
            </Grid>

            <Grid item xs={6}>
              <TextField
                fullWidth
                type="number"
                label="Longitude"
                value={formData.longitude || -9.1393}
                onChange={(e) => handleChange('longitude', parseFloat(e.target.value) || -9.1393)}
                disabled={isLoading}
                inputProps={{ step: 0.000001 }}
              />
            </Grid>

            {/* Contactos */}
            <Grid item xs={12} sm={4}>
              <TextField
                fullWidth
                label="Telefone"
                value={formData.telefone || ''}
                onChange={(e) => handleChange('telefone', e.target.value)}
                disabled={isLoading}
              />
            </Grid>

            <Grid item xs={12} sm={4}>
              <TextField
                fullWidth
                label="Website"
                value={formData.website || ''}
                onChange={(e) => handleChange('website', e.target.value)}
                disabled={isLoading}
              />
            </Grid>

            <Grid item xs={12} sm={4}>
              <TextField
                fullWidth
                label="Email"
                type="email"
                value={formData.email || ''}
                onChange={(e) => handleChange('email', e.target.value)}
                disabled={isLoading}
              />
            </Grid>

            {/* Facilidades */}
            <Grid item xs={12}>
              <Box sx={{ display: 'flex', flexWrap: 'wrap', gap: 2 }}>
                <FormControlLabel
                  control={
                    <Switch
                      checked={formData.acessibilidade || false}
                      onChange={(e) => handleChange('acessibilidade', e.target.checked)}
                      disabled={isLoading}
                    />
                  }
                  label="Acessibilidade"
                />
                <FormControlLabel
                  control={
                    <Switch
                      checked={formData.estacionamento || false}
                      onChange={(e) => handleChange('estacionamento', e.target.checked)}
                      disabled={isLoading}
                    />
                  }
                  label="Estacionamento"
                />
                <FormControlLabel
                  control={
                    <Switch
                      checked={formData.wc || false}
                      onChange={(e) => handleChange('wc', e.target.checked)}
                      disabled={isLoading}
                    />
                  }
                  label="Casa de Banho"
                />
                <FormControlLabel
                  control={
                    <Switch
                      checked={formData.interior || false}
                      onChange={(e) => handleChange('interior', e.target.checked)}
                      disabled={isLoading}
                    />
                  }
                  label="Interior"
                />
                <FormControlLabel
                  control={
                    <Switch
                      checked={formData.exterior || false}
                      onChange={(e) => handleChange('exterior', e.target.checked)}
                      disabled={isLoading}
                    />
                  }
                  label="Exterior"
                />
                <FormControlLabel
                  control={
                    <Switch
                      checked={formData.ativo || false}
                      onChange={(e) => handleChange('ativo', e.target.checked)}
                      disabled={isLoading}
                    />
                  }
                  label="Ativo"
                />
              </Box>
            </Grid>
          </Grid>
        </DialogContent>

        <DialogActions>
          <Button onClick={onClose} disabled={isLoading}>
            Cancelar
          </Button>
          <Button
            type="submit"
            variant="contained"
            disabled={isLoading}
            startIcon={isLoading ? <CircularProgress size={16} /> : null}
          >
            {isLoading
              ? (isEditing ? 'A atualizar...' : 'A criar...')
              : (isEditing ? 'Atualizar' : 'Criar')
            }
          </Button>
        </DialogActions>
      </form>
    </Dialog>
  );
};

export default PoiForm;
