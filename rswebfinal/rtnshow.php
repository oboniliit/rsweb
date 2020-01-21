<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>RoutineShow</title>
  <link rel="stylesheet" href="css/bootstrap.css">
  <link rel="stylesheet" href="css/rtn.css">
  <link rel="stylesheet" href="css/search.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>  
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

<!-- <table class="table table-borderd center table-striped table-hover" style="border:4px solid black ;" border="5"> -->

<h1 class="text-center font-weight-bold mt-4 head" style="padding-top: 100px;">Full Routine View</h1>
<div class="schedule-wrap">
   <div align="center" style="padding-top: 20px; padding-left: 700px;">
    <form class="example"  style="margin:auto;max-width:200px;">

                     <input type="text" name="search" id="search" placeholder='search routine.....' /> 
                     <button type="submit"><i class="fa fa-search"></i></button>
    </form> 
                </div>  
                       

  <table ID="routine_table" class="table table-borderd center table-striped" style="border:4px solid black ;" border="5">
    <thead>
      <tr>
        <th class="day">Day/Time</th>
        <th id="s01">8.30-9.50</th>
        <th id="s02">10.00-11.20</th>
        <th id="s03">11.30-12.50</th>
        <th id="sb">1.00-2.00</th>
        <th id="s05">2.00-4.45</th>
      </tr>
    </thead>
    <tbody>      
    <?php 
    if(isset($_GET['id'])) {
      $id =$_GET['id'];
      $sql ="SELECT * FROM routine_new where id = '$id';";
      $rs = $conn->query($sql);
      //$rs=mysql_query($sql,$conn) or die(mysql_error());
      //while ($result=mysql_fetch_array($rs))       


      if ($rs->num_rows>0){
        while ( $result = $rs->fetch_assoc() ) {  
          $routine = unserialize($result['routine']);
          foreach ($routine as $day => $timeWithCourses) {          
            echo '<tr>';
            echo '<td id="day">' . $day . 'day</td>';
            foreach ($timeWithCourses as $time => $courses) {
              echo '<td>';
              foreach ($courses as $course) {
                echo '<div>' . $course. '</div>';
              }
              echo '</td>';

              if( $day == 'Sun' && $time == '11.30-12.50' ) echo '<td rowspan="5">Break</td>';
            }
            echo '</tr>';
          }
        }
      } else {
        echo "0 results";
      }
    }
    $conn->close();
    ?>
    </tbody>
  </table>
  <div class="section-print">
    <div class="row">
      <div class="md-col-12" style="padding-left: 600px;padding-top: 20px;">
              <button onclick="window.print()" id="printrtn" class="button1" style="color: white;">
              <a href="#"><i class="fa fa-print" style="font-size:24px ;color:white;"></i>  Print Routine</a>
            </button>
         </div>
       </div>
     </div>

</div>
<script src="js/bootstrap.js"></script>
<script src="js/search.js"></script>

</body>
</html>

