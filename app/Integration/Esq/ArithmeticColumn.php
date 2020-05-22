<?php

namespace App\Integration\Esq;


class ArithmeticColumn extends IColumn {
    public $column1; // IColumn
    public $column2; // IColumn
    public $arithmeticOperation;

    function __construct($column1, $column2, $arithmeticOperation, $name = null) {
        parent::__construct(IColumn::ArithmeticColumnType, $name);
        $this->column1 = $column1;
        $this->column2 = $column2;
        $this->setArithmeticOperation($arithmeticOperation);
    }
    function setArithmeticOperation($value) {
        $this->arithmeticOperation = $value;
    }
    function getNameInDB() {
        return $this->column1->getNameInDB() . ArithmeticOperation::GetSql($this->arithmeticOperation) . $this->column2->getNameInDB();
    }
}
