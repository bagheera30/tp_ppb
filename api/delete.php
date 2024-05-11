<?php
include ("dbConnect.php");
$conn = dbConnecte();
if (isset($_POST["id"])) {
    $id = $_POST["id"];
} else
    return;
$q = "DELETE FROM storage WHERE id='$id'";
$e = mysqli_query($conn, $q);
$arr = [];
if ($e) {
    $arr["sukses"] = "true";
} else {
    $arr["sukses"] = "false";
}
print (json_encode($arr));
?>