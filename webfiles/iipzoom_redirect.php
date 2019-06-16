<?php
    header("Location:./iipzoom/iipzoom.php" . ($_GET ? "?" . $_SERVER['QUERY_STRING'] : ""));
    exit;
?>
