<?php
    header("Location:./openseadragon/openseadragon.php" . ($_GET ? "?" . $_SERVER['QUERY_STRING'] : ""));
    exit;
?>
