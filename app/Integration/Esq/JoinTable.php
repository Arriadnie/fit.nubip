<?php

namespace App\Integration\Esq;


class JoinTable {
    private $schemaName; // String (example (main schema 'Ingredient'): DishId(Dish).Type(DishType).Name)
    // (main schema 'ProductType'): [Product:TypeId:Id].Name
    private $schemaColumn; // String

    private $joinToSchema; // String
    private $joinToColumn; // String

    private $alias; // String
    private $joinSchema;

    function __construct($joinString = "", $joinToSchema = "") {

        if ($joinString == "") {
            return;
        }

        if ($joinString{0} == "=" || $joinString{0} == ">" || $joinString{0} == "<") {
            $this->joinSchema = $joinString{0} == "=" ? "INNER" :
                $joinString{0} == "<" ? "RIGHT" : "LEFT";
            $joinString = substr($joinString, 1);
        }
        else {
            $this->joinSchema = "LEFT";
        }


        if ($joinString{0} == "[") {
            $joinString = substr($joinString, 1, -1);

            $args = explode(":", $joinString);
            $this->schemaName = $args[0];
            $this->schemaColumn = $args[1];
            $this->joinToColumn = count($args) > 2 ? $args[2] : "Id";
        }
        else {
            $this->schemaColumn = "Id";
            $this->joinToColumn = substr($joinString, 0, strpos($joinString, "("));
            $this->schemaName = substr($joinString, strpos($joinString, "(")+1, - 1);
        }

        $this->joinToSchema = $joinToSchema;
    }

    function getAlias() {
        return $this->alias;
    }
    function setAlias($value) {
        $this->alias = $value;
    }

    function equals($joinTable) {
        return $this->schemaName === $joinTable->schemaName &&
            $this->schemaColumn === $joinTable->schemaColumn &&
            $this->joinToSchema === $joinTable->joinToSchema &&
            $this->joinToColumn === $joinTable->joinToColumn;
    }
    function getSql() {
        return " LEFT JOIN " . $this->schemaName . " " . $this->getAlias() . " ON " .
            $this->getAlias() . "." . $this->schemaColumn . "=" .
            $this->joinToSchema . "." . $this->joinToColumn;
    }
}
