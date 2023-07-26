<?php

require_once 'connection.php';

if ($con) {
    $no_telpon = $_POST['no_telpon'];

    $query = "SELECT * FROM tb_pengguna WHERE no_telpon = '$no_telpon'";
    $result = mysqli_query($con, $query);
    $response = array();

    $row = mysqli_num_rows($result);
    if ($row > 0) {
        array_push($response, array(
            'status' => 'OK'
        ));
    }else{
        array_push($response, array(
            'status' => 'FAILED'
        ));        
    }
}else{
    array_push($response, array(
        'status' => 'FAILED'
    ));
}

echo json_encode(array("server_response" => $response));
mysqli_close($con);

?>