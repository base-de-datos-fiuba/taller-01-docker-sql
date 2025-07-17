#!/bin/bash

# ===============================================
# SCRIPT DE BACKUP Y EXPORTACIÓN COMPLETA
# ===============================================
# Archivo: backup_and_export.sh
# Propósito: Crear SQL dump y exportar datos completos

echo "=== BACKUP Y EXPORTACIÓN DE LA BASE DE DATOS ==="
echo "Fecha: $(date)"
echo ""

# Variables de configuración
DB_NAME="bdd_db"
DB_USER="admin"
CONTAINER_NAME="postgres_taller_db"
BACKUP_DIR="./backup"

# Crear directorio de backup si no existe
mkdir -p $BACKUP_DIR

echo "1. Creando SQL dump completo..."
# Crear SQL dump completo de la base de datos
docker exec $CONTAINER_NAME pg_dump -U $DB_USER -d $DB_NAME > $BACKUP_DIR/bdd_db_dump.sql

echo "2. Creando SQL dump solo de esquema..."
# Crear dump solo del esquema (sin datos)
docker exec $CONTAINER_NAME pg_dump -U $DB_USER -d $DB_NAME --schema-only > $BACKUP_DIR/bdd_db_schema.sql

echo "3. Creando SQL dump solo de datos..."
# Crear dump solo de los datos (sin esquema)
docker exec $CONTAINER_NAME pg_dump -U $DB_USER -d $DB_NAME --data-only > $BACKUP_DIR/bdd_db_data.sql

echo "4. Exportando tablas a CSV..."
# Copiar archivos CSV del contenedor al host
docker cp $CONTAINER_NAME:/var/lib/postgresql/data/teams_export.csv $BACKUP_DIR/ 2>/dev/null || echo "teams_export.csv no encontrado"
docker cp $CONTAINER_NAME:/var/lib/postgresql/data/matches_export.csv $BACKUP_DIR/ 2>/dev/null || echo "matches_export.csv no encontrado"
docker cp $CONTAINER_NAME:/var/lib/postgresql/data/top_teams.csv $BACKUP_DIR/ 2>/dev/null || echo "top_teams.csv no encontrado"
docker cp $CONTAINER_NAME:/var/lib/postgresql/data/important_matches.csv $BACKUP_DIR/ 2>/dev/null || echo "important_matches.csv no encontrado"

echo "5. Creando backup comprimido..."
# Crear archivo comprimido con todo el backup
tar -czf $BACKUP_DIR/bdd_backup_$(date +%Y%m%d_%H%M%S).tar.gz -C $BACKUP_DIR *.sql *.csv 2>/dev/null || echo "Algunos archivos no se encontraron"

echo ""
echo "=== BACKUP COMPLETADO ==="
echo "Archivos generados en el directorio: $BACKUP_DIR"
echo ""
ls -la $BACKUP_DIR/

echo ""
echo "=== INFORMACIÓN DE LOS ARCHIVOS ==="
echo "- bdd_db_dump.sql: Dump completo (estructura + datos)"
echo "- bdd_db_schema.sql: Solo estructura de la base de datos"
echo "- bdd_db_data.sql: Solo datos de la base de datos"
echo "- *.csv: Archivos CSV exportados"
echo "- bdd_backup_*.tar.gz: Archivo comprimido con todo el backup"
