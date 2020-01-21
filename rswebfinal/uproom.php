<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Update Room</title>
  <link rel="stylesheet" href="css/up.css">
<link rel="stylesheet" href="css/bootstrap.css">
</head>

<body class="background">
	
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
      <div class="md-col-6" style="padding-left: 80px;padding-top: 30px;">
<button id="myBtn" class="button1">Add New Room</button>
             </div>
       <div class="md-col-6" style="padding-left: 600px;padding-top: 30px;">
        <button onclick="goBack()" class="button1"><a url="nav.php">Go To Admin Panel</a></button>
         </div>
      </div>
</div>


<div id="myModal" class="modal" style="position: center;">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
    </div>
    <div class="modal-body">
      <form method="post" action="uproom.php">
     <label>Room_no</label>
     <input type="varchar" name="room_no" value=""/>
     <br />
     <label>Floor</label>
     <input type="int" name="floor" value=""  />
     <br/>
     <label>Room_type</label>
     <input type="varchar" name="room_type" value="" />
     <br />
     <label>Capacity</label>
     <input type="int" name="capacity" value="" />
     <br />
     <input type="submit" name="submit_btn" value="Insert" />
    </form>
    </div>
    <div class="modal-footer">
    </div>
  </div>

</div>

<table class="table table-borderd center table-striped table-hover" style="border:4px solid black ;" border="5">

<!--show data from database-->
<h1 class="text-center font-weight-bold mt-4 head">Update Room List</h1>
<div class="container">
<?php 
echo "<tr>
<th>Room_no</th>
<th>Floor</th>
<th>Room_type</th>
<th>Capacity</th>
<td>Action</td>
</tr>";

if (isset($_POST['submit_btn']))
   {
    $room_no=$_POST["room_no"];
    $floor=$_POST["floor"];
    $room_type=$_POST["room_type"];
    $capacity=$_POST["capacity"];

   
   $sql="INSERT INTO room (room_no,floor,room_type,capacity) VALUES ('$room_no','$floor','$room_type','$capacity')";
   mysqli_query($conn,$sql);
}

$sql="SELECT *FROM room";
$result=$conn->query($sql);

if ($result->num_rows>0) {
	while($row=$result->fetch_assoc()){
    echo "<tr><th>" . $row["room_no"] .
    "</th><th>" . $row["floor"] .
    "</th><th>" . $row["room_type"] .
    "</th><th>" . $row["capacity"] .

      
     "</td><td><a class='btn btn-primary'
    href=uproom.php?id=".$row["room_no"].">Delete</a></td></tr>";
}

if(isset($_GET['id'])){

$id=$_GET['id'];
$sql="DELETE FROM room where room_no='$id'";
if($conn->query($sql)==TRUE){
  header('location:uproom.php');
}
else{
  echo "fail to Delete";
}

}

}
   else {

   	echo "0 results";
   }
   $conn->close();
   ?>

</table>
</div>
     <script src="js/bootstrap.js"></script>
     <script src="js/up.js"></script>
</body>
</html>