<?php

namespace App\Integration\Esq;


class FilterItemNull extends IFilterItem {
    private $isNull;

    function __construct($column, $isNull = true) {
        parent::__construct($column, IFilterItem::NullType);
        $this->isNull = $isNull;
    }
    function getSql() {
        return $this->column->getNameInDB() . " IS " . ($this->isNull ? "" : "NOT ") . "NULL";
    }
}
