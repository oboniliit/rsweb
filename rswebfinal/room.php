<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
</head>


<link rel="stylesheet" href="css/prac.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/rs.css">

<body class="back">
	
<div class="section-navbar">
		<div class="container">
	    <div class="row">
	       <div class="md-col-12">
	       <div class="topnav fixed-top" class="topnav">

	        	    <a href="routine.php">Routine</a>
                <a class="active" href="#">Room</a>
                <a href="teacher.php">Teacher</a>
                <a href="course.php">Course</a>
                <a href="log.php">Admin</a>
                <a href="RS.php">Home</a>
                <div class="topnav-left">
                	<a href="#default" class="logo"></a>
            </div>
        </div>
       </div> 
     </div>
  </div>
</div>








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


<table class="table table-borderd center table-striped table-hover" style="border:4px solid black ;" border="5">

<!--show data from database-->




<h1 class="text-center font-weight-bold mt-4 head">Available Rooms of IIT</h1>




<div class="container">
<?php 
echo "<tr>
<th>Room_no</th>
<th>Floor</th>
<th>Room_type</th>
<th>Capacity</th>
</tr>";

$sql="SELECT *FROM room";
$result=$conn->query($sql);

if ($result->num_rows>0) {
	while($row=$result->fetch_assoc()){
    echo "<tr><th>" . $row["room_no"] .
    "</th><th>" . $row["floor"] .
    "</th><th>" . $row["room_type"] .
    "</th><th>" . $row["capacity"] .
    "<br>";
    "</th></tr>";
}
   }
   else {

   	echo "0 results";
   }
   $conn->close();
   ?>

</table>
</div>

</body>
</html>