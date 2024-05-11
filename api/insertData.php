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
$query = "INSERT INTO `storage`(`name`, `category`, `description`) VALUES ('$name','$category','$description')";
$exe = mysqli_query($conn, $query);
$arr = [];
if ($exe) {
    $arr["sukses"] = 'true';
} else {
    $arr["sukses"] = "false";
}
print (json_encode($arr));
?>