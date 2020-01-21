<?php 

class Course {
  private static $objectCounter = 0;
  public $id;
  public $title;
  public $code;
  public $credit;
  public $batch;
  public $teacher;

  function __construct( $code, $title, $teacher, $credit = 3 ) {
    Course::$objectCounter++;
    
    $this->id = Course::$objectCounter;
    $this->code = $code;
    $this->title = $title;

    preg_match( '%[A-Za-z]+\s([0-9]{2})%', $code, $parsed_batch );
    $this->batch = intval( $parsed_batch[1] );

    $this->teacher = $teacher;
    $this->credit = $credit;
  }  
}