<?php
require_once __DIR__ . '/SingletonConexion.php';
class datos{
    static public function clases(){
        try {
            $conn = SingletonConexion::getInstance()->getConnection();

            $query = "SELECT TIME_FORMAT(a.desde, '%H:%i') AS desde,TIME_FORMAT(a.hasta, '%H:%i') AS hasta,
            MAX(CASE WHEN a.dia = 1 THEN (CASE WHEN b.id IS NULL THEN 'Disponible' ELSE 'Reservado' END) END) AS lunes,
            MAX(CASE WHEN a.dia = 2 THEN (CASE WHEN b.id IS NULL THEN 'Disponible' ELSE 'Reservado' END) END) AS martes,
            MAX(CASE WHEN a.dia = 3 THEN (CASE WHEN b.id IS NULL THEN 'Disponible' ELSE 'Reservado' END) END) AS miercoles,
            MAX(CASE WHEN a.dia = 4 THEN (CASE WHEN b.id IS NULL THEN 'Disponible' ELSE 'Reservado' END) END) AS jueves,
            MAX(CASE WHEN a.dia = 5 THEN (CASE WHEN b.id IS NULL THEN 'Disponible' ELSE 'Reservado' END) END) AS viernes,
            MAX(CASE WHEN a.dia = 6 THEN (CASE WHEN b.id IS NULL THEN 'Disponible' ELSE 'Reservado' END) END) AS sabado,
            MAX(CASE WHEN a.dia = 7 THEN (CASE WHEN b.id IS NULL THEN 'Disponible' ELSE 'Reservado' END) END) AS domingo
            FROM clases a
            LEFT JOIN inscripciones b ON b.id_clase = a.id
            GROUP BY a.desde, a.hasta ORDER BY a.desde";
            $result = mysqli_query($conn, $query);
            
            if (!$result) return [];

            return $result->fetch_all(MYSQLI_ASSOC); 
        } catch (\Throwable $th) {
            return [];
        }
    }

    static public function clases_totales(){
        try {
            $conn = SingletonConexion::getInstance()->getConnection();

            $query = "SELECT a.id,TIME_FORMAT(a.desde,'%H:%i') as desde,TIME_FORMAT(a.hasta,'%H:%i') as hasta,
            a.dia,CASE WHEN b.id is null THEN 'Disponible' ELSE 'Reservado' END as estado
            FROM clases a
            LEFT JOIN inscripciones b ON b.id_clase = a.id
            ORDER BY a.dia,a.desde";
            $result = mysqli_query($conn, $query);
            
            if (!$result) return [];

            return $result->fetch_all(MYSQLI_ASSOC); 
        } catch (\Throwable $th) {
            return [];
        }
    }

    static public function niveles(){
        try {
            $conn = SingletonConexion::getInstance()->getConnection();

            $query = "SELECT * FROM niveles";
            $result = mysqli_query($conn, $query);
            
            if (!$result) return [];

            return $result->fetch_all(MYSQLI_ASSOC); 
        } catch (\Throwable $th) {
            return [];
        }
    }

    static public function valores(){
        try {
            $conn = SingletonConexion::getInstance()->getConnection();

            $query = "SELECT CASE descripcion WHEN 'Clase individual' THEN 1 WHEN 'The English Table' THEN 2
            WHEN 'Clase grupal' THEN 4 ELSE 3 END AS orden,
            descripcion,if(valor in(0),'Consultar aranceles',CONCAT('$',FORMAT(valor, 2, 'de_DE'))) as valor FROM valores ORDER BY 1";
            $result = mysqli_query($conn, $query);
            
            if (!$result) return [];

            return $result->fetch_all(MYSQLI_ASSOC); 
        } catch (\Throwable $th) {
            return [];
        }
    }
}