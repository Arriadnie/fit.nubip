<?php

namespace App\Integration\Esq;


class Update extends Query {
    public $Filters; // Filter

    function __construct($schemaName, $collection = null) {
        parent::__construct($schemaName, $collection);
        $this->Filters = new Filter();
    }


    function CreateColumn($columnName) {
        return $this->_getColumnByColumnOrName($columnName);
    }
    function CreateAggregationColumn($aggregationType, $columnName, $alias = null) {
        $col = $this->_getColumnByColumnOrName($columnName);
        $aCol = new AggregationColumn($col, $alias, $aggregationType);
        return $aCol;
    }
    function CreateArithmeticColumn($columnName1, $columnName2, $arithmeticOperation, $alias = null) {
        $col1 = $this->_getColumnByColumnOrName($columnName1);
        $col2 = $this->_getColumnByColumnOrName($columnName2);
        $aCol = new ArithmeticColumn($col1, $col2, $arithmeticOperation, $alias);
        return $aCol;
    }
    function CreateFilterWithParameter($column, $conditionType, $value) {
        $col = $this->CreateColumn($column);
        return new FilterItemWithParameter($col, $conditionType, $value);
    }
    function CreateAggregationFilter($aggregationType, $column, $conditionType, $value) {
        $col = $this->CreateAggregationColumn($aggregationType, $column);
        return new FilterItemWithParameter($col, $conditionType, $value);
    }
    function CreateNullFilter($column) {
        $col = $this->CreateColumn($column);
        return new FilterItemNull($col, true);
    }
    function CreateNotNullFilter($column) {
        $col = $this->CreateColumn($column);
        return new FilterItemNull($col, false);
    }
    function CreateFilterGroup() {
        if (func_num_args() > 0) {
            return new Filter(func_get_arg(0));
        }
        return new Filter();
    }

    private function _getColumnByColumnOrName($column) {
        if (gettype($column) == "string") {
            return new Column($column);
        }
        else {
            return $column;
        }
    }
    protected function _getSql() {
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
        if (!$this->Filters->isEmpty()) {
            $sql .= " WHERE " . $this->Filters->getSql();
        }
        return $sql;
    }
}
