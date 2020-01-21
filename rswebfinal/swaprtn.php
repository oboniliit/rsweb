<pre>
<?php 

if( !isset($_POST['course1']) || !isset($_POST['course2']) ) {  
  header('location:editrtn.php?id=' . $_POST['id']);
  exit();
}

$rid = $_POST['id'];

$course1 = explode(',', $_POST['course1']);
$course2 = explode(',', $_POST['course2']);

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

$sql ="SELECT * FROM routine_new where id = '$rid';";
$rs = $conn->query($sql);
if ($rs->num_rows>0){
  while ( $result = $rs->fetch_assoc() ) {  
    $routine = unserialize($result['routine']);      
  }
}

if( isset($course1) && isset($course2) ) {
  $routine[$course1[0]][$course1[1]][$course1[2]] = $course2[3];
  $routine[$course2[0]][$course2[1]][$course2[2]] = $course1[3];

  $serialized_routine = serialize($routine);  
  $sql = "UPDATE routine_new SET routine = '$serialized_routine' WHERE id = $rid;";

  if( !$conn->query($sql) ) {
    die(mysqli_error($con));
  } else {
    header('location:editrtn.php?id=' . $rid);
    exit();
  }

  $conn->close();
}


?>
</pre>