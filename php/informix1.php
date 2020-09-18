<?php
    try{
        $bd = new PDO("informix:host=10.1.52.4; service=3002;database=dsipe; server=aguila_sipe_tcp; protocol=onsoctcp;EnableScrollableCursors=1", "sao", "saodesa1");
        $q = $bd->prepare("SELECT * FROM informix.directo where NUM_ISSSTE = 1234");
        if(!$q){
            die("Execute query error, because: ". print_r($bd->errorInfo(),true) );
        }else{
            $q->execute();
            $result = $q->fetch(PDO::FETCH_ASSOC);
            print_r($result);
        }
    }catch(Exception $e){
        die('Error de conexion '.$e->GetMessage() );
    }finally{
        $bd=null;
    }

?>