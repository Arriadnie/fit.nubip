<?php

namespace App\Integration\Esq;


abstract class IFilterItem {
    const WithParamType = 1;
    const NullType = 2;

    protected $column;
    private $type;

    function __construct($column, $type) {
        $this->column = $column;
        $this->type = $type;
    }

    function _containtsAggregationColumns() {
        return $this->column->type == IColumn::AggregationColumnType;
    }
}
