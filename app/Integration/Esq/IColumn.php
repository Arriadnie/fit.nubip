<?php

namespace App\Integration\Esq;


abstract class IColumn {
    const ColumnType = 1;
    const ArithmeticColumnType = 2;
    const AggregationColumnType = 3;

    public $type;

    public $name;
    public $OrderDirection;
    public $OrderPosition;

    function __construct($type, $name = null) {
        $this->type = $type;
        $this->setAlias($name);
    }
    function getNameInDB() {
        return "";
    }
    function getSql() {
        return $this->getNameInDB() . " " . $this->name;
    }
    function setAlias($value) {
        $this->name = $value;
    }
    function isOrder() {
        return isset($this->OrderDirection) && !is_null($this->OrderDirection) && !empty($this->OrderDirection);
    }
    function orderPositionCompare($a, $b) {
        $ap = !is_null($a->OrderPosition) ? $a->OrderPosition : 100;
        $bp = !is_null($b->OrderPosition) ? $b->OrderPosition : 100;
        return $ap - $bp;
    }
}
