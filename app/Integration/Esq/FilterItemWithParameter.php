<?php

namespace App\Integration\Esq;


class FilterItemWithParameter extends IFilterItem {
    private $conditionType;
    private $value;

    function __construct($column, $conditionType, $value) {
        parent::__construct($column, IFilterItem::WithParamType);
        $this->conditionType = $conditionType;
        $this->value = $value;
    }
    function getSql() {
        $sql = $this->column->getNameInDB() . " ";
        $sql .= ConditionType::GetSql($this->conditionType) . " ";
        if ($this->value === true) {
            return $sql . "1";
        }
        if ($this->value === false) {
            return $sql . "0";
        }
        return $sql . (Livlag::IsString($this->value) ? "'" : "") . $this->value .
            (Livlag::IsString($this->value) ? "'" : "");
    }
}
