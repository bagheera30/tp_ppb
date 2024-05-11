<?php
include ("dbConnect.php");
$conn = dbConnecte();
if (isset($_POST["name"])) {
    $name = $_POST["name"];
} else
    return;
if (isset($_POST["category"])) {
    $category = $_POST["category"];
} else
    return;
if (isset($_POST["description"])) {
    $description = $_POST["description"];
} else
    return;
if (isset($_POST["id"])) {
    $id = $_POST["id"];
} else
    return;
$q = "UPDATE storage SET name='$name',category='$category',description='$description' WHERE id='$id'";
$e = mysqli_query($conn, $q);
$arr = [];
if ($e) {
    $arr["success"] = "true";
} else {
    $arr["success"] = "false";
}
print (json_encode($arr));
?>