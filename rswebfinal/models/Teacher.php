<?php 

class Teacher {
  private static $objectCounter = 0;
  public $id;
  public $code;
  public $name;

  function __construct( $id, $name, $code = "" ) {
    // Teacher::$objectCounter++;

    $this->id = $id;
    $this->name = $name;
    $this->code = $code;
  } 
}