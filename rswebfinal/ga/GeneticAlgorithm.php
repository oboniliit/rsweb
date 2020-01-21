<?php 
require_once("ga/Data.php");
require_once("ga/Schedule.php");
require_once("ga/Population.php");

class GeneticAlgorithm {
  public static $populationSize = 200;
  public static $crossOverRate = 0.95;
  public static $mutationRate = 0.05;
  public static $noOfElites = 20;
  public static $tornamentPopulationSize = 3;

  private $generation;
  private $data;
  private $population;
  private $solvedSchedule;

  public function setUp() {
    $this->data = new Data();
    $this->population = new Population( $this->data );
    $this->generation = 0;
  }

  public function generateSolutionRoutine() {
    while( $this->population->getBestSchedule()->conflicts != 0 ) {  
      $this->generation++;
      $this->population->crossover();
      $this->population->mutate();

      if( $this->generation > 500 ) break;
    }

    $this->solvedSchedule = $this->population->getBestSchedule();
    $this->saveRoutineToDB();

    if( $this->solvedSchedule instanceof Schedule ) return true;
    
    return false;
  }

  public function printClassSchedule() {
    if( $this->solvedSchedule != Null ) {
      $this->solvedSchedule->printScheduleTable($this->generation);      
    } else {
      $this->generateSolutionRoutine();  
      $this->solvedSchedule->printScheduleTable($this->generation);
    }
  }

  private function saveRoutineToDB() {
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
    
    $date = date('Y-m-d H:i:s');
    $serializedSchedule = serialize($this->solvedSchedule->formatScheduleClassesForTable());    
    $sql = "INSERT INTO routine_new (routine, time_generated) VALUES ('$serializedSchedule', '$date');";

    if( !$conn->query($sql) ) {
      die(mysqli_error($con));
    } 

    $conn->close();
  }
}

