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



<div class="content-section">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          	
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
<div class="section-button">
  <div class="container">
    <div class="row">
      <div class="md-col-12" style="padding-left: 900px;padding-top: 30px;">

        <button onclick="goBack()" class="button1"><a url="nav.php">Go To Admin Panel</a></button>
         </div>
      </div>
</div>

<table class="table table-borderd center table-striped table-hover" style="border:4px solid black ;" border= "5">


<h1 class="text-center font-weight-bold mt-4 head">Update Routine</h1>
<?php
echo "<tr>
		<td>Serial No.</td>
		<td>Created Date</td>
    <td>Action1</td>
    <td>Action2</td>
    <td>Action3</td>
		</tr>";

	//set counter variable 
	$counter = 1; 

	$sql = "SELECT * FROM routine_new";
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
    	
        echo "<tr><td>" . $counter . 
        "</td><td>" . $row["time_generated"] . 
        //"</td><td><a class='btn btn-primary' href=artn.php?id=".$row["uuid"].">Edit</a> . 
        "</td><td><a class='btn btn-primary' href=rtnshow.php?id=".$row["id"].">View</a></td>&nbsp;<td><a class='btn btn-primary' href=editrtn.php?id=".$row["id"].">Edit</a></td>&nbsp;<td><a class='btn btn-primary' href=uprtn.php?id=".$row["id"].">Delete</a></td></tr>";
        $counter++; //increment counter by 1 on every pass
    }

    if(isset($_GET['id'])){
      $id=$_GET['id'];
      $sql="DELETE FROM routine_new WHERE id='$id'";
  if ($conn->query($sql)==TRUE) {
  header('location:uprtn.php');
  }
  else{
  echo "Fail to Delete";
  }
  }
}

else{
	echo "0 results";
}
$conn->close();
?>
</table>

<p class="text-center">
  <a href="genrtn.php" id="genrtn" class="button1">Generate Routine</a>
</p>

        </div>
      </div>
    </div>
  </div>

<script src="js/bootstrap.js"></script>
<script src="js/up.js"></script>

</body>
</html>