<?php

namespace App\Integration\Esq;


class EntitySchemaQuery {

    public $schemaName; // string
    public $columns; // array Column
    private $joinedTables; // array JoinTable
    public $Filters; // Filter
    public $allColumn = false; // bool

    function __construct($schemaName) {
        $this->schemaName = $schemaName;
        $this->columns = array();
        $this->Filters = new Filter();

        $this->joinedTables = array();
    }

    function AddColumn($columnName, $alias = null) {
        $col = $this->CreateColumn($columnName, $alias);
        array_push($this->columns, $col);
        return $col;
    }
    function AddAggregationColumn($aggregationType, $columnName, $alias = null) {
        $col = $this->CreateAggregationColumn($aggregationType, $columnName, $alias);
        array_push($this->columns, $col);
        return $col;
    }
    function AddArithmeticColumn($columnName1, $columnName2, $arithmeticOperation, $alias = null) {
        $col = $this->CreateArithmeticColumn($columnName1, $columnName2, $arithmeticOperation, $alias);
        array_push($this->columns, $col);
        return $col;
    }

    function CreateColumn($columnName, $alias = null) {
        $col = $this->_getColumnByColumnOrName($columnName);
        if (!is_null($alias)) {
            $col->setAlias($alias);
        }
        return $col;
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

    private function _getColumnByColumnOrName($column) {
        if (gettype($column) == "string") {
            return $this->_getColumnWithAddJoinTable($column);
        }
        else {
            return $column;
        }
    }
    private function _getColumnWithAddJoinTable($columnName, $joinTbl = "mntbl") {
        if (!Livlag::Containt($columnName, ".")) {
            return new Column($joinTbl . "." . $columnName);
        }
        $tbl = substr($columnName, 0, strpos($columnName, "."));
        $table = $this->_addJoinTable(new JoinTable($tbl, $joinTbl));
        $column = substr($columnName, strpos($columnName, ".") + 1);
        return $this->_getColumnWithAddJoinTable($column, $table->getAlias());
    }
    function _addJoinTable($table) {
        foreach($this->joinedTables as $key => $value) {
            if ($table->equals($value)) {
                return $value;
            }
        }
        $table->setAlias("tbl" . count($this->joinedTables));
        array_push($this->joinedTables, $table);
        return $table;
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

    private function _getSelectSql() {
        $sql = "SELECT ";
        if ($this->allColumn || count($this->columns) == 0) {
            $sql .= "*";
        }
        else {
            for($i = 0; $i < count($this->columns); $i++) {
                $sql .= $this->columns[$i]->getSql() . ", ";
            }
            $sql = substr($sql, 0, -2);
        }
        $sql .= " FROM " . $this->schemaName . " mntbl";
        foreach($this->joinedTables as $key => $value) {
            $sql .= $value->getSql();
        }
        return $sql;
    }
    public function _getFilterSql() {
        $sql = $this->_getSelectSql();
        if (!$this->Filters->isEmpty()) {
            $sql .= " WHERE " . $this->Filters->getSql();
        }
        $sql .= $this->_groupSql();
        $sql .= $this->_orderSql();
        return $sql;
    }
    public function _getIdSql($id) {
        $sql = $this->_getSelectSql();
        $sql .= " WHERE ";
        if (!$this->Filters->isEmpty()) {
            $sql .= "(" . $this->Filters->getSql() . ")";
            $sql .= " AND ";
        }
        $sql .= "mntbl.Id='" . $id . "'";
        $sql .= $this->_groupSql();
        return $sql;
    }

    private function _groupSql() {
        if (!$this->_containtsAggregationColumns()) {
            return "";
        }
        $sql = "";
        for($i = 0; $i < count($this->columns); $i++) {
            if (!isset($this->columns[$i]->aggregationType)) {
                $sql .= $this->columns[$i]->name . ", ";
            }
        }
        $sql = $sql == "" ? "" :substr($sql, 0, -2);
        return $sql === "" ? "" : (" GROUP BY " . $sql);
    }
    private function _orderSql() {
        $ordCols = array_filter($this->columns, function($col) {
            return $col->isOrder();
        });
        if (count($ordCols) == 0) {
            return "";
        }
        usort($ordCols, array("IColumn", "orderPositionCompare"));

        $sql = " ORDER BY ";
        foreach ($ordCols as $key => $column) {
            $sql .= $column->name . " " . OrderDirection::GetSql($column->OrderDirection) . ", ";
        }
        $sql = substr($sql, 0, -2);
        return $sql;
    }

    function _containtsAggregationColumns() {
        foreach($this->columns as $key => $value) {
            if ($value->type == IColumn::AggregationColumnType) {
                return true;
            }
        }
        return $this->Filters->_containtsAggregationColumns();
    }

    function GetEntityCollection() {
        //return $this->_getFilterSql();
        //
        $result = DataBaseHandler::GetCollectionByQuery($this->_getFilterSql());
        $entitys = array();
        for ($i = 0; $i < count($result); $i++) {
            $entitys[$i] = new Entity($this->schemaName, $result[$i]);
        }
        return $entitys;
    }

    function GetEntity($id) {
        //return $this->_getIdSql($id);
        //
        $result = DataBaseHandler::GetCollectionByQuery($this->_getIdSql($id));
        return (count($result) > 0) ? new Entity($this->schemaName, $result[0]) : NULL;
    }

    static function CreateEntity($schemaName) {
        return Entity::Create($schemaName);
    }
}
