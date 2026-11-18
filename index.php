<?php
require_once __DIR__.'/libs/smarty3.php';
require_once __DIR__.'/clases/consultas.php';

$page = trim($_GET['page'] ?? 'inicio', '/');
$smarty->assign('PAGE', $page);
$smarty->assign('NAV_PREFIX', $page === 'inicio' ? '' : '/bond.english/');
$smarty->assign('HEADER', $smarty->fetch('partials/header.html'));
$smarty->assign('FOOTER', $smarty->fetch('partials/footer.html'));
switch($page){
    case 'inicio':
        $smarty->assign('ANIO', date('Y'));
        $smarty->assign('CANT_ANIO', (date('Y')-2019));
        $smarty->assign('RESERVAS', datos::reservas());
        $smarty->assign('VALORES', datos::valores());
        $smarty->assign('VALOR_HORA', datos::valores()[0]['valor']);
        $smarty->assign('VALOR_CHARLA', datos::valores()[1]['valor']);
        $smarty->display('index.html');
        break;
    case 'inscripciones':
        $smarty->assign('ANIO', date('Y'));
        $smarty->assign('RESERVAS', datos::reservas());
        $smarty->assign('VALORES', datos::valores());
        $smarty->display('inscripciones.html');
        break;
    case 'productos':
        $smarty->assign('PRODUCTO_EDITAR', '');
        $smarty->assign('MENSAJE', $_GET['ok'] ?? '');
        $smarty->display('productos.html');
        break;
    case 'carrito':
        $smarty->display('index.html');
        break;
    case 'contacto':
        $smarty->display('index.html');
        break;
    default:
        header("HTTP/1.0 404 Not Found");
        echo "Página no encontrada";
}