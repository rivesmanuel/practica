<?php
class db
{
  const HOST = "mariadb";
  const DBNAME = "mvc_pdo";
  const USER = "manuel";
  const PASSWORD = "0117"; // Evidentemente adapta los valores
  const DB_CHARSET = "utf8mb4";

  static public function conexion()
  {
    $conexion = null;
    try {
      $opciones = [PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION];
      $conexion = new PDO('mysql:host=' . self::HOST . ';dbname=' . self::DBNAME . ";charset=" . self::DB_CHARSET,
        self::USER, self::PASSWORD, $opciones);
    }
    catch (Exception $e) {
      echo "Ocurrió algo con la base de datos: " . $e->getMessage();
    }
    return $conexion; //Es un objeto de conexion PDO
  }
}