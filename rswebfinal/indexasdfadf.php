<?php 
require_once("ga/GeneticAlgorithm.php");

$gal = new GeneticAlgorithm();
$gal->setup();

// $gal->getRoutineSchedule()->formatScheduleClassesForTable()
$gal->printClassSchedule();


?>