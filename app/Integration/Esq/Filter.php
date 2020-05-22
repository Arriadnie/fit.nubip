<?php

namespace App\Integration\Esq;


class Filter {
    public $expressionType;
    private $filters;

    function __construct() {
        if (func_num_args() > 0) {
            $this->expressionType = func_get_arg(0);
        }
        else {
            $this->expressionType = ExpressionType::AND;
        }

        $this->filters = array();
    }

    function Add($name, $filter) {
        $this->filters[$name] = $filter;
    }
    function AddItem($filter) {
        $this->Add("f" . rand(), $filter);
    }
    function getSql() {
        if ($this->isEmpty()) {
            return "";
        }
        $sql = "";
        $expressSql = ExpressionType::GetSql($this->expressionType);
        foreach($this->filters as $key => $value) {
            $sql .= "(" . $value->getSql() . ") " . $expressSql . " ";
        }

        return substr($sql, 0, strlen($sql) - strlen($expressSql) - 2);
    }
    function isEmpty() {
        return empty($this->filters);
    }

    function _containtsAggregationColumns() {
        foreach($this->filters as $key => $value) {
            if ($value->_containtsAggregationColumns()) {
                return true;
            }
        }
        return false;
    }
}
