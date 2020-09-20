<?php
    try{
        $bd = new PDO("informix:host=ip; service=puerto;database=base_de_datos; server=servidor; protocol=onsoctcp;EnableScrollableCursors=1", "usuario", "contraeña");
        $q = $bd->prepare("SELECT * FROM informix.directo where NUM = 1234");
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