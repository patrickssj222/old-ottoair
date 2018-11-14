<?php

require('../utils.php');
configSession();

$r = mysqli_query($db, "show tables");
while ($row =mysqli_fetch_assoc($r)) {
    var_dump($row);
    echo '<br/>';
}