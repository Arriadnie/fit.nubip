<?php

namespace App\Integration\Esq;


class Entity {
    public $values; // custom object
    public $schemaName; // string
    public $IsNew; // bool

    function __construct($schemaName, $collection = null) {
        $this->schemaName = $schemaName;
        $this->values = array();
        if (is_null($collection)) {
            $this->IsNew = true;
            return;
        }
        $this->IsNew = false;
        foreach ($collection as $key => $value) {
            $this->values[$key] = $value;
        }
    }

    function GetColumnValue($columnName) {
        return $this->values[$columnName];
    }
    function GetValuesCollection() {
        return $this->values;
    }
    function SetColumnValue($columnName, $value) {
        $this->values[$columnName] = $value;
    }

    function SetDefaultValues() {
        $this->values["Id"] = Livlag::NewGuid();
    }

    static function Create($schemaName) {
        $entity = new \App\Integration\Base\Entity($schemaName);
        // Some code for set columns config;
        return $entity;
    }

    function Save() {
        if ($this->IsNew) {
            $sql = $this->_getInsertSql();
        }
        else {
            $sql = $this->_getUpdateSql();
        }
        //echo $sql;
        DataBaseHandler::ExecuteQuery($sql);
    }

    private function _getInsertSql() {
        $sqlInsert = "INSERT INTO " . $this->schemaName . " (";
        $sqlValues = "VALUES (";


        foreach ($this->values as $key => $value) {
            if (is_null($value)) {
                continue;
            }
            $sqlInsert .= $key . ", ";
            $sqlValues .= (Livlag::IsString($value) ? "'" : "") . $value . (Livlag::IsString($value) ? "'" : "") . ", ";
        }
        $sqlInsert = substr($sqlInsert, 0, -2);
        $sqlValues = substr($sqlValues, 0, -2);
        $sqlInsert .= ")";
        $sqlValues .= ")";

        $sql = $sqlInsert . " " . $sqlValues;
        return $sql;
    }
    private function _getUpdateSql() {
        $sql = "UPDATE " . $this->schemaName . " SET ";

        foreach ($this->values as $key => $value) {
            if (is_null($value)) {
                continue;
            }
            if ($key == "Id") {
                continue;
            }
            $sql .= $key . "=" . (Livlag::IsString($value) ? "'" : "") . $value . (Livlag::IsString($value) ? "'" : "") . ", ";
        }
        $sql = substr($sql, 0, -2);
        $sql .= " WHERE Id='" . $this->values["Id"] . "'";
        return $sql;
    }
}
