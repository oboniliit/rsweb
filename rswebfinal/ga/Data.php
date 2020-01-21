<?php 

require_once("models/Course.php");
require_once("models/Teacher.php");
require_once("models/ClassRoom.php");
require_once("models/ClassTime.php");
require_once("models/CourseClass.php");

class Data {
  public $courses;
  public $teachers;
  public $classRooms;
  public $classTimes;

  public $numCourses;
  public $numTeachers;
  public $numClassRooms;
  public $numClassTimes;
  public $numLabClasses;

  function __construct() {
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

    $teacher_sql = "SELECT * FROM teacher;";
    $teacher_result =$conn->query($teacher_sql);
    $this->teachers = array();

    if( $teacher_result && $teacher_result->num_rows>0 ) {
      while($row=$teacher_result->fetch_assoc()){
        $this->teachers[] =  new Teacher( intval($row['id']), $row['teacher_name'], $row['teacher_id']);  
      }
    }
    
    $course_sql = "SELECT * FROM course;";
    $course_result =$conn->query($course_sql);
    $this->courses = array();
    $this->numLabClasses = 0;

    if( $course_result && $course_result->num_rows>0 ) {
      while($row=$course_result->fetch_assoc()){
        if( empty($row['course_title']) ) continue;

        if( $row['course_credit'] == 3 ) {
          $this->courses[] = new Course( $row['course_id'], $row['course_title'], $this->getTeacherById($row['course_teacher']), 3 );
          $this->courses[] = new Course( $row['course_id'], $row['course_title'], $this->getTeacherById($row['course_teacher']), 3 );
        } else {
          $this->courses[] = new Course( $row['course_id'], $row['course_title'], $this->getTeacherById($row['course_teacher']), 1.5 );
          $this->numLabClasses++;
        }
      }
    }    

    $room_sql = "SELECT * FROM room;";
    $room_result =$conn->query($room_sql);
    $this->classRooms = array();

    if( $room_result && $room_result->num_rows>0 ) {
      while($row=$room_result->fetch_assoc()){
        $this->classRooms[] =  new ClassRoom( $row['room_no'] );        
      }
    }

    $this->classTimes = array( 
      new ClassTime( "Sun", "8.30-9.50" ),
      new ClassTime( "Sun", "10.00-11.20" ),
      new ClassTime( "Sun", "11.30-12.50" ),
      new ClassTime( "Sun", "2.00-4.45", 1.5 ),
      new ClassTime( "Mon", "8.30-9.50" ),
      new ClassTime( "Mon", "10.00-11.20" ),
      new ClassTime( "Mon", "11.30-12.50" ),
      new ClassTime( "Mon", "2.00-4.45", 1.5 ),
      new ClassTime( "Tues", "8.30-9.50" ),
      new ClassTime( "Tues", "10.00-11.20" ),
      new ClassTime( "Tues", "11.30-12.50" ),
      new ClassTime( "Tues", "2.00-4.45", 1.5 ),
      new ClassTime( "Wednes", "8.30-9.50" ),
      new ClassTime( "Wednes", "10.00-11.20" ),
      new ClassTime( "Wednes", "11.30-12.50" ),
      new ClassTime( "Wednes", "2.00-4.45", 1.5 ),
      new ClassTime( "Thurs", "8.30-9.50" ),
      new ClassTime( "Thurs", "10.00-11.20" ),
      new ClassTime( "Thurs", "11.30-12.50" ),
      new ClassTime( "Thurs", "2.00-4.45", 1.5 )
    );
    
    $conn->close();

    $this->numCourses = count($this->courses);
    $this->numTeachers = count($this->teachers);
    $this->numClassRooms = count($this->classRooms);
    $this->numClassTimes = count($this->classTimes);
  }

  public function getTeacherById($id) {
    foreach ($this->teachers as $teacher) {
      if( $teacher->id == intval($id) ) return $teacher;
    }

    return null;
  }
}

    