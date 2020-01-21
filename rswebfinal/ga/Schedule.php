<?php 

class Schedule {
  public $classes;
  public $fitnessScore = -1;
  public $conflicts = 0;
  public $data;

  function __construct( $data ) {
    $this->data = $data;
    $this->classes = array();
  }

  function initialize() {
    for( $i=0; $i<$this->data->numCourses; $i++ ) {      
      $randClassRoom = $this->data->classRooms[mt_rand(0,$this->data->numClassRooms-1)];      
      $randClassTime = $this->data->classTimes[mt_rand(0,$this->data->numClassTimes-1)];

      $this->classes[] = new CourseClass( $this->data->courses[$i], $randClassRoom, $randClassTime, $this->data->courses[$i]->teacher );      
    }
    $this->calculateFitnessScore();
  }

  function calculateFitnessScore() {
    $totalConflicts = 0;

    $totalLabClasses = 0;
    for ( $i=0; $i<$this->data->numCourses; $i++ ) {
      $firstClass = $this->classes[$i];
      if( $firstClass->course->credit == 1.5 ) $totalLabClasses++;
      
      if( $firstClass->course->credit != $firstClass->classTime->credit ) $totalConflicts++;
      if( $totalLabClasses > $this->data->numLabClasses ) $totalConflicts++;
      
      for ( $j=$i+1; $j<$this->data->numCourses; $j++ ) {
        $secondClass = $this->classes[$j];
        if( $firstClass->classTime->id == $secondClass->classTime->id ) {
          if( $firstClass->course->batch == $secondClass->course->batch ) $totalConflicts++;
          if( $firstClass->teacher->id == $secondClass->teacher->id ) $totalConflicts++;
          if( $firstClass->classRoom->id == $secondClass->classRoom->id ) $totalConflicts++;          
        }        
      }
    }

    $this->conflicts = $totalConflicts;
    $this->fitnessScore = 1 - sqrt($this->conflicts / ($this->data->numCourses*4 + 1));
    // $this->fitnessScore = 1 / ($this->conflicts + 1);
  }

  function crossOver( $schedule ) {
    $child = new Schedule($this->data);

    for ($i=0; $i < $this->data->numCourses; $i++) { 
      if( mt_rand(1,2) > 1 ) $child->classes[$i] = $this->classes[$i];
      else $child->classes[$i] = $schedule->classes[$i];
    }

    $child->calculateFitnessScore();
    return $child;
  }

  function mutate() {
    $newSchedule = new Schedule($this->data);
    $newSchedule->initialize();

    for ($i=0; $i < $this->data->numCourses; $i++) { 
      if( GeneticAlgorithm::$mutationRate > mt_rand(0,99)/100 ) {
        $this->classes[$i] = $newSchedule->classes[$i];
      }
    }

    $this->calculateFitnessScore();
  }

  function __toString () {
    $output = "";
    foreach ($this->classes as $class) {
      $output .= $class . " <br> ";
    }

    return $output . "Fitness Score: {$this->fitnessScore}" ;
  }

  function sortScheduleByClassTime() {
    usort( $this->classes, array("Schedule", "sortScheduleByClassTimeComparator") );     
  }

  static function sortScheduleByClassTimeComparator( $a, $b ) {
    if ( $a->classTime->id == $b->classTime->id ) {
      return 0;
    }

    return $a->classTime->id < $b->classTime->id ? -1 : 1;
  }

  function formatScheduleClassesForTable() {
    $this->sortScheduleByClassTime();    
    $printableSchedule = array(
      'Sun' => array(
        '8.30-9.50'   => array(),
        '10.00-11.20' => array(),
        '11.30-12.50' => array(),
        '2.00-4.45'   => array()       
      ),
      'Mon' => array(
        '8.30-9.50'   => array(),
        '10.00-11.20' => array(),
        '11.30-12.50' => array(),
        '2.00-4.45'   => array()       
      ),
      'Tues' => array(
        '8.30-9.50'   => array(),
        '10.00-11.20' => array(),
        '11.30-12.50' => array(),
        '2.00-4.45'   => array()       
      ),
      'Wednes' => array(
        '8.30-9.50'   => array(),
        '10.00-11.20' => array(),
        '11.30-12.50' => array(),
        '2.00-4.45'   => array()       
      ),
      'Thurs' => array(
        '8.30-9.50'   => array(),
        '10.00-11.20' => array(),
        '11.30-12.50' => array(),
        '2.00-4.45'   => array()       
      )
    );

    foreach ( $this->classes as $class ) {
      $day = $class->classTime->day;
      $time = $class->classTime->time;
      
      $printableSchedule[$day][$time][] = "{$class->course->code} ({$class->classRoom->name}) <br> {$class->teacher->name}";
    }

    return $printableSchedule;
  }

  function printScheduleTable( $generation ) {
    $printableSchedule = $this->formatScheduleClassesForTable();
  ?>
<div class="schedule-wrap">
  <h3>Generation #<?php echo $generation; ?></h3>
  <table>
    <thead>
      <tr>
        <th class="day">Day/Time</th>
        <th id="s01">8.30-9.50</th>
        <th id="s02">10.00-11.20</th>
        <th id="s03">11.30-12.50</th>
        <th id="sb">1.00-2.00</th>
        <th id="s05">2.00-4.45</th>
      </tr>
    </thead>
    <tbody>
      <?php 
        foreach ($printableSchedule as $day => $timeWithCourses) {          
          echo '<tr>';
          echo '<td id="day">' . $day . 'day</td>';
          foreach ($timeWithCourses as $time => $courses) {
            echo '<td>';
            foreach ($courses as $course) {
              echo $course. '</br>';
            }
            echo '</td>';

            if( $day == 'Sun' && $time == '11.30-12.50' ) echo '<td rowspan="5">Break</td>';
          }
          echo '</tr>';
        }
      ?>
    </tbody>
  </table>
  <p>Fitness Score: <?php echo round($this->fitnessScore,2); ?>, Conflicts: <?php echo $this->conflicts; ?></p>
</div>
<style>
  .schedule-wrap {
    text-align: center;
  }

  h3 {
    margin-bottom: 5px;
  }

  p {
    margin: 5px 0 10px;
  }

  table {
    margin: 0 auto 10px;
    border: 1px solid black;    
  }

  td, th {
    border: 1px solid #555;
    text-align: center;
  }
</style>
  <?php 
  }
}