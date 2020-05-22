<?php

namespace App\Integration\Esq;


abstract class Query {
    public $schemaName; // string
    public $values; // array CustomObject

    function __construct($schemaName, $collection = null) {
        $this->schemaName = $schemaName;


        $this->values = array();
        if (is_null($collection)) {
            return;
        }
        foreach ($collection as $key => $value) {
            $this->values[$key] = $value;
        }
    }
    function SetColumnValue($columnName, $value) {
        $this->values[$columnName] = $value;
    }

    function Execute() {
        $sql = $this->_getSql();
        //echo $sql;
        DataBaseHandler::ExecuteQuery($sql);
    }

    protected function _getSql() {
        return "";
    }
}
