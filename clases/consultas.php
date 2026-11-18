<?php
require_once __DIR__ . '/SingletonConexion.php';
class datos{
    static public function reservas(){
        try {
            $conn = SingletonConexion::getInstance()->getConnection();

            $query = "SELECT TIME_FORMAT(desde,'%H:%i') as desde,TIME_FORMAT(hasta,'%H:%i') as hasta,if(lunes=1,'Reservado','Disponible') as lunes,
            if(martes=1,'Reservado','Disponible') as martes,if(miercoles=1,'Reservado','Disponible') as miercoles,if(jueves=1,'Reservado','Disponible') as jueves,
            if(viernes=1,'Reservado','Disponible') as viernes,if(sabado=1,'Reservado','Disponible') as sabado,if(domingo=1,'Reservado','Disponible') as domingo FROM reservas ORDER BY desde";
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