<?php


    function filterDbData($input)
    {
        return mysql_escape_string(strip_tags($input) );
        // return 'aa';
    }