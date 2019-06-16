<?php
    header("Location:./iipmooviewer/iipmooviewer.php" . ($_GET ? "?" . $_SERVER['QUERY_STRING'] : ""));
    exit;
?>
