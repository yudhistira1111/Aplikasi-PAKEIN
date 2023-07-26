<?php 
require_once 'connection.php';

if ($con) {

    $email = $_POST['email'];

    $insert = "INSERT INTO tb_pengguna(email) VALUES('$email')";


    if ($email !="") {
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