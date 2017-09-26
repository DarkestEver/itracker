<?php
session_start();
$_SESSION['user111']=$_GET['user'];
echo $_SESSION['user'];
?> 