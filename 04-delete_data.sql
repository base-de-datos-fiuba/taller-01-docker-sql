-- Mostrar el contenido actual de la tabla teams
SELECT 'Contenido de la tabla teams ANTES de la eliminación:' AS info;
SELECT * FROM teams;

-- Contar filas antes de eliminar
SELECT COUNT(*) AS "Filas antes de eliminar" FROM teams;

-- Eliminar la fila específica insertada (Argentina)
DELETE FROM teams 
WHERE team = 'Argentina';

-- Verificar cuántas filas fueron eliminadas
SELECT 'Fila eliminada exitosamente' AS resultado;

-- Mostrar el contenido después de la eliminación
SELECT 'Contenido de la tabla teams DESPUÉS de la eliminación:' AS info;
SELECT * FROM teams;

-- Contar filas después de eliminar
SELECT COUNT(*) AS "Filas después de eliminar" FROM teams;