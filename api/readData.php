<?php
include ("dbConnect.php");
$conn = dbConnecte();
$q = "SELECT `id`, `name`, `category`, `description` FROM `storage`";
$exe = mysqli_query($conn, $q);
$arr = [];
while ($row = mysqli_fetch_assoc($exe)) {
    $arr[] = $row;
}
print (json_encode($arr));
?>