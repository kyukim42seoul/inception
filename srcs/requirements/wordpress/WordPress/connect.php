<?php
$db_conn = @mysqli_connect("mariadb:3306", "kyukim", "kim13245", "wordpress");
if (!$db_conn) {
    $error = mysqli_connect_error();
    $errno = mysqli_connect_errno();
    print "$errno: $error\n";
    exit();
}
echo "Fail Connect";
mysqli_close($db_conn);
?>

