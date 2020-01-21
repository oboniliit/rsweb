<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Course</title>
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
<button id="myBtn" class="button1">Add New Course</button>
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
    	<form method="post" action="upcourse.php">
     <label>Course_id</label>
     <input type="varchar" name="course_id" value=""/>
     <br />
     <label>Course_title</label>
     <input type="varchar" name="course_title" value=""  />
     <br/>
     <label>Course_credit</label>
     <input type="int" name="course_credit" value="" />
     <br />
    <?php 
      $teacher_sql="SELECT * FROM teacher";
      $teacher_result=$conn->query($teacher_sql);
    ?>
    <label>Course_teacher</label>
     <select name="course_teacher" id="course_teacher">
        <option value="none">Select</option>
       <?php  
        if ($teacher_result->num_rows>0) {
          while($teacher=$teacher_result->fetch_assoc()){
            echo "<option value='" . $teacher["id"] .  "'>" . $teacher["teacher_name"] .  "</option>";
          }
        }
       ?>
     </select>
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
<h1 class="text-center font-weight-bold mt-4 head">Update Course List</h1>
<div class="container">
	

<!-- The Modal -->

<?php 
echo "<tr>
<th>Course_id</th>
<th>Course_title</th>
<th>Course_credit</th>
<th>Course_teacher</th>
<td>Action</td>

</tr>";

if (isset($_POST['submit_btn']))
   {
   	$course_id=$_POST["course_id"];
   	$course_title=$_POST["course_title"];
   	$course_credit=$_POST["course_credit"];
    $course_teacher=intval($_POST["course_teacher"]);
   
   $sql="INSERT INTO course (course_id,course_title,course_credit,course_teacher) VALUES ('$course_id','$course_title','$course_credit', $course_teacher)";
   mysqli_query($conn,$sql);
}

$sql="SELECT course.id course_id, course.course_id course_code, course.course_title course_title, course.course_credit, course.course_teacher course_teacher, teacher.teacher_name teacher_name, teacher.teacher_id teacher_id  FROM course JOIN teacher ON course.course_teacher = teacher.id";
$result=$conn->query($sql);

  if ($result->num_rows>0) {
    while($row=$result->fetch_assoc()){
      echo "<tr><td>" . $row["course_code"] .
      "</td><td>" . $row["course_title"] .
      "</td><td>" . $row["course_credit"] .
      "</td><td>" . $row["teacher_name"] .     
       "</td>
        <td>
          <a class='btn btn-primary' href='courseforms.php?action=delete&id=".$row['course_id']. "'>Delete</a>
        </td>
      </tr>";
    }
  }
  else {
    echo "0 results";
  }

  $conn->close();
?>

   

</table>

     <script src="js/bootstrap.js"></script>
     <script src="js/up.js"></script>


</body>
</html>