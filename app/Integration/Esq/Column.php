<?php

namespace App\Integration\Esq;


class Column extends IColumn {

    public $nameInDB;

    function __construct($nameInDB, $name = null) {
        parent::__construct(IColumn::ColumnType, $name);
        $this->nameInDB = $nameInDB;
        $this->setAlias($name);
    }

    function getNameInDB() {
        return $this->nameInDB;
    }

    private function _getAliasFromDBName($alias) {
        return (!is_null($alias) && $alias != "") ? $alias :
            (Livlag::Containt($this->nameInDB, ".") ? end(explode(".", $this->nameInDB)) : $this->nameInDB);
    }
    function setAlias($value) {
        $this->name = $this->_getAliasFromDBName($value);
    }
}
