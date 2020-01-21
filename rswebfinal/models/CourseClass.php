<?php 

class CourseClass {
  private static $objectCounter = 0;
  public $id;
  public $course;
  public $classRoom;
  public $classTime;
  public $teacher;  

  function __construct( $course, $classRoom, $classTime, $teacher ) {
    CourseClass::$objectCounter++;

    $this->id = CourseClass::$objectCounter;
    $this->course = $course;
    $this->classRoom = $classRoom;
    $this->classTime = $classTime;
    $this->teacher = $teacher;
  }

  function __toString() {
    return "{$this->course->code} - {$this->classRoom->name}- {$this->classTime->day}-{$this->classTime->time} - {$this->teacher->name}";
  }
}