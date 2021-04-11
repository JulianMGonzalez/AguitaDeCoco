<?php
include_once 'conexion.php';
$objeto = new Conexion();
$conexion = $objeto->Conectar();

$_POST = json_decode(file_get_contents("php://input"), true);

function permisos() {  
  if (isset($_SERVER['HTTP_ORIGIN'])){
      header("Access-Control-Allow-Origin: *");
      header("Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS");
      header("Access-Control-Allow-Headers: Origin, Authorization, X-Requested-With, Content-Type, Accept");
      header('Access-Control-Allow-Credentials: true');      
  }  
  if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS'){
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))          
        header("Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS");
    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
        header("Access-Control-Allow-Headers: Origin, Authorization, X-Requested-With, Content-Type, Accept");
    exit(0);
  }
}
permisos();


$opcion = (isset($_POST['opcion'])) ? $_POST['opcion'] : '';
$id = (isset($_POST['id'])) ? $_POST['id'] : '';
$descripcion = (isset($_POST['descripcion'])) ? $_POST['descripcion'] : '';
$nombre = (isset($_POST['nombre'])) ? $_POST['nombre'] : '';
$imagen = (isset($_POST['precio'])) ? $_POST['imagen'] : '';
$precio = (isset($_POST['precio'])) ? $_POST['precio'] : '';
$descuento = (isset($_POST['precio'])) ? $_POST['descuento'] : '';
$estado = (isset($_POST['estado'])) ? $_POST['estado'] : '';
$stock = (isset($_POST['stock'])) ? $_POST['stock'] : '';

switch($opcion){
	case 1:
        $consulta = "SELECT id, descripcion, nombre, imagen, precio, descuento, estado, stock FROM articulos";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;
    case 2:
        $consulta = "INSERT INTO articulos (descripcion, nombre, imagen, precio, descuento, estado, stock) VALUES('$descripcion', '$nombre', '$imagen', '$precio', '$descuento', '$estado', '$stock') ";
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();                
        break;
    case 3:
        $consulta = "UPDATE articulos SET descripcion='$descripcion', nombre='$nombre', imagen='$imagen', precio='$precio', descuento='$descuento', estado='$estado', stock='$stock' WHERE id='$id' ";		
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();                        
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);
        break;        
    case 4:
        $consulta = "UPDATE articulos SET estado='0' WHERE id='$id'";		
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);                    
        break; 
    case 5:
        $consulta = "UPDATE articulos SET estado='1' WHERE id='$id'";		
        $resultado = $conexion->prepare($consulta);
        $resultado->execute();
        $data=$resultado->fetchAll(PDO::FETCH_ASSOC);                        
        break;     
    
}
print json_encode($data, JSON_UNESCAPED_UNICODE);
$conexion = NULL;