<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Update Teacher List</title>
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
<button id="myBtn" class="button1">Add New Teacher</button>
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
      <form method="post" action="upteacher.php">
     <label>Teacher_id</label>
     <input type="varchar" name="teacher_id" value=""/>
     <br />
     <label>Teacher_name</label>
     <input type="text" name="teacher_name" value=""  />
     <br/>
     <label>Designation</label>
     <input type="text" name="designation" value="" />
     <br />
     <label>Department_name</label>
     <input type="text" name="department_name" value="" />
     <br />
     <label>Email_id</label>
     <input type="email" name="email_id" value="" />
     <br />
     <input type="submit" name="submit_btn" value="Insert" />
    </form>
    </div>
    <div class="modal-footer">
    </div>
  </div>

</div>



<table class="table table-borderd center table-striped table-hover" style="border:4
px solid black ;" border="5">

<!--show data from database-->

<h1 class="text-center font-weight-bold mt-4 head">Update Teacher List</h1>
<div class="container">
<?php 
echo "<tr>
<th>Teacher_id</th>
<th>Teacher_name</th>
<th>Designation</th>
<th>Department_name</th>
<th>Email_id</th>
<td>Action</td>
</tr>";

if (isset($_POST['submit_btn']))
   {
    $teacher_id=$_POST["teacher_id"];
    $teacher_name=$_POST["teacher_name"];
    $designation=$_POST["designation"];
    $department_name=$_POST["department_name"];
    $email_id=$_POST["email_id"];
   
   $sql="INSERT INTO teacher (teacher_id,teacher_name,designation,department_name,email_id) VALUES ('$teacher_id','$teacher_name','$designation','$department_name','$email_id')";
   mysqli_query($conn,$sql);
}

$sql="SELECT *FROM teacher";
$result=$conn->query($sql);

if ($result->num_rows>0) {
	while($row=$result->fetch_assoc()){
    echo "<tr><th>" . $row["teacher_id"] .
    "</th><th>" . $row["teacher_name"] .
    "</th><th>" . $row["designation"] .
    "</th><th>" . $row["department_name"] .
    "</th><th>" . $row["email_id"] .

     "</td><td><a class='btn btn-primary'
    href=upteacher.php?id=".$row["teacher_id"].">Delete</a></td></tr>";
}

if(isset($_GET['id'])){

$id=$_GET['id'];
$sql="DELETE FROM teacher where teacher_id='$id'";
if($conn->query($sql)==TRUE){
  header('location:upteacher.php');
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