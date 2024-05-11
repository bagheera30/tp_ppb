<?php

function dbConnecte()
{
    $con = mysqli_connect("localhost", "root", "", "storage");
    if (!$con) {
        die("Koneksi gagal: " . mysqli_connect_error());
    }
    return $con;
}