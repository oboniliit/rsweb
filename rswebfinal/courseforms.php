<?php 
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "routinescheduler";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


if( isset($_GET['id']) && isset($_GET['action']) && $_GET['action'] == "delete" ){
  $id=$_GET['id'];
  $sql="DELETE FROM course where id='$id'";
 
  if($conn->query($sql)==TRUE){
    header('location:upcourse.php');
    exit();
  } else {
    echo "fail to Delete";
  }
}