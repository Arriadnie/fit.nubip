<?php

namespace App\Integration\Esq;


class Insert extends Query {
    protected function _getSql() {
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
}
