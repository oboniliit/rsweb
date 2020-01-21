<?php 

class ClassRoom {
  private static $objectCounter = 0;
  public $id;
  public $name;

  function __construct( $name ) {
    ClassRoom::$objectCounter++;
    
    $this->id = ClassRoom::$objectCounter;
    $this->name = $name;
  }
}