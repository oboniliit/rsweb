<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>routine</title>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/rtn.css">
	
</head>

<body class="background">

<div class="section-navbar">
		<div class="container">
	    <div class="row">
	       <div class="md-col-12">
	       <div class="topnav fixed-top" class="topnav">

	        	<a class="active" href="#">Routine</a>
                <a href="room.php">Room</a>
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

	<br><h1 class="text-center font-weight-bold mt-4 head" style="padding-top: 100px;">Existing Routine List</h1>

<?php
echo "<tr>
		<td>Serial No.</td>
		<td>Created Date</td>
		<td>Action</td>
		</tr>";

	//set counter variable 
	$counter = 1; 

	$sql = "SELECT * FROM routine_new";
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
    	
        echo "<tr><td>" . $counter . 
        "</td><td>" . $row["time_generated"] .   
        "</td><td><a class='btn btn-primary'
        href=rtnshow.php?id=".$row["id"].">View</a></td></tr>";
        $counter++; //increment counter by 1 on every pass
   }
   }

else{
	echo "0 results";
}
$conn->close();
?>
</table>

</body>
</html>