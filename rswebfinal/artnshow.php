<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>RoutineShow</title>
	<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
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
//echo "Connected Successfully";
?>

<table class="table table-hover" border="5">
<?php


echo "<tr>
		<td>Row No.</td>
		<td>Course ID</td>
		<td>Teacher's Name</td>
		<td>Room</td>
		<td>Time</td>
		</tr>";

if(isset($_GET['id'])){
$sql="SELECT * FROM routine where uuid = '".$_GET["id"]."' ";
$rs=mysql_query($sql,$conn) or die(mysql_error());
while ($result=mysql_fetch_array($rs))    	 
    {
     echo "<tr><td>" . $result["classorder"] . 
        "</td><td>" . $result["courseid"] . 
        "</td><td>" . $result["teacherid"] . 
        "</td><td>" . $result["roomid"] . 
        "</td><td>" . $result["classtime"] . 
        "<br>"; 
        "</td></tr>";
    }

}
$conn->close();
?>
</table>
</body>
</html>