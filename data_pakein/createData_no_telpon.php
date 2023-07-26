<?php 
require_once 'connection.php';

if ($con) {
    $no_telpon = $_POST['no_telpon'];

    $insert = "INSERT INTO tb_pengguna(no_telpon) VALUES('$no_telpon')";


    if ($no_telpon != "") {
        $result = mysqli_query($con, $insert);
        $response = array();
        
        if($result) {
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
}else{
    array_push($response, array(
        'status' => 'FAILED'
    ));
}

echo json_encode(array("server_response" => $response));
mysqli_close($con);
?>