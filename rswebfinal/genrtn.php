<?php 
require_once("ga/GeneticAlgorithm.php");

$gal = new GeneticAlgorithm();

$gal->setup();
if( $gal->generateSolutionRoutine() ) {
  header('location:uprtn.php');
  exit();
}
// $gal->printClassSchedule();