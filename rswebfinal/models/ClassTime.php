<?php 

class ClassTime {
  private static $objectCounter = 0;
  public $id;
  public $day;
  public $credit;
  public $time;

  function __construct( $day, $time, $credit = 3 ) {
    ClassTime::$objectCounter++;
    
    $this->id = ClassTime::$objectCounter;
    $this->day = $day;
    $this->time = $time;
    $this->credit = $credit;
  } 
}