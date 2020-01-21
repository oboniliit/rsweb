<?php 

class Population {
  public $schedules;

  function __construct( $data ) {
    for( $i=0; $i<GeneticAlgorithm::$populationSize; $i++ ) {
      $schedule = new Schedule($data);
      $schedule->initialize();
      
      $this->schedules[] = $schedule;
    }
  }

  function sortByFitness( $schedules ) {
    usort( $schedules, array("Population", "sortByFitnessComparator") );   

    return $schedules;
  }

  static function sortByFitnessComparator( $a, $b ) {
    if ( $a->fitnessScore == $b->fitnessScore ) {
      return 0;
    }
    return $a->fitnessScore > $b->fitnessScore ? -1 : 1;
  }

  function crossOver() {
    $this->schedules = $this->sortByFitness($this->schedules);

    for ($i=GeneticAlgorithm::$noOfElites; $i<GeneticAlgorithm::$populationSize; $i++) { 
      if( GeneticAlgorithm::$crossOverRate > mt_rand(0,99)/100  ) {        
        $schedule1 = $this->selectTournamentPopulation()[0];
        $schedule2 = $this->selectTournamentPopulation()[0];
        
        $this->schedules[$i] = $schedule1->crossOver($schedule2); 
      }
    }
  }

  function mutate() {
    for ($i=GeneticAlgorithm::$noOfElites; $i<GeneticAlgorithm::$populationSize; $i++) {       
      $this->schedules[$i]->mutate();
    }
  }

  function getBestFitnessScore() {
    $this->schedules = $this->sortByFitness($this->schedules);

    return $this->schedules[0]->fitnessScore;
  }

  function getBestSchedule() {
    return $this->sortByFitness($this->schedules)[0];
  }

  function selectTournamentPopulation() {
    $tournamentPopulation = array();

    for ($i=0; $i<GeneticAlgorithm::$tornamentPopulationSize; $i++) { 
      $rand_index = mt_rand(0, GeneticAlgorithm::$populationSize-1 );
      $tournamentPopulation[] = $this->schedules[$rand_index];
    }
       
    $tournamentPopulation = $this->sortByFitness($tournamentPopulation);
    return $tournamentPopulation;
  }

  function __toString() {
    $this->schedules = $this->sortByFitness($this->schedules);
    $output = "";

    foreach ( $this->schedules as $schedule ) {
      $output .= $schedule . "# " . $schedule->fitnessScore . "<br>";
    }

    return $output;
  }
}