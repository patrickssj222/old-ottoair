<?php  

// $con = mysqli_connect('localhost', 'smarteye_svdcctv', 'j159632', 'smarteye_svdcctv');

// mysqli_multi_query($con, file_get_contents('manualDump.sql'));
exec("mysql -u smarteye_svdcctv -pj159632 smarteye_svdcctv < manualDump.sql", $output, $code);

// var_dump(getcwd());
// exec("mysqldump -u smarteye_svdcctv -pj159632 smarteye_svdcctv > ".getcwd()."/manualDump2.sql", $output, $code);
var_dump($output);
var_dump($code);



?>