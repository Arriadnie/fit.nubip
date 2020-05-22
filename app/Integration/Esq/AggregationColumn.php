<?php

namespace App\Integration\Esq;


class AggregationColumn extends IColumn {

    public $column; // IColumn
    public $aggregationType;


    function __construct($column, $name = null, $aggregationType) {
        parent::__construct(IColumn::AggregationColumnType, $name);
        if (gettype($column) == "string") {
            $this->column = new Column($column);
        }
        else {
            $this->column = $column;
        }
        $this->setAggregationFunction($aggregationType);
    }

    function setAggregationFunction($value) {
        $this->aggregationType = $value;
    }
    function isAggregation() {
        return !is_null($this->aggregationType);
    }
    function getNameInDB() {
        return AggregationFunction::GetSql($this->aggregationType) . "(" . $this->column->getNameInDB() . ")";
    }

}
