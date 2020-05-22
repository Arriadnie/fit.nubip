<?php

namespace App\Integration\Esq;


class EntitySchemaQueryConverter {
    static function GetFromCustomObject($object) {
        if (is_null($object) || !isset($object)) {
            throw new Exception("Empty settings");
        }

        if (isset($object["type"])) {
            return self::GetQueryFromCustomObject($object);
        }
        $current = new EntitySchemaQuery($object["schemaName"]);
        $current->allColumn = $object["allColumn"] == "true";
        foreach ($object["columns"] as $key => $column) {
            $col = self::_getColumnByColumnOrName($column, $current);
            $current->AddColumn($col);
        }
        $current->Filters = self::_AddFilterToEsq($object["Filters"], $current);
        return $current;
    }

    private static function _AddFilterToEsq($filter, $esq) {
        $newFilter = new Filter($filter["expressionType"]);
        if (!isset($filter["filters"])) {
            return $newFilter;
        }
        foreach ($filter["filters"] as $key => $value) {
            if (is_null($value) || is_null($value["filters"])) {

                $filt = self::_AddFilterItemToEsq($value, $esq);

                if (!is_null($filt)) {
                    $newFilter->Add($key, $filt);
                }
            }
            else {
                $newFilter->Add($key, self::_AddFilterToEsq($value, $esq));
            }
        }
        return $newFilter;
    }
    private static function _AddFilterItemToEsq($value, $esq) {
        $col = self::_getColumnByColumnOrName($value["column"], $esq);

        if ($value["type"] == IFilterItem::WithParamType) {
            return $esq->CreateFilterWithParameter($col, $value["conditionType"], $value["value"]);
        }
        else if ($value["type"] == IFilterItem::NullType) {
            if ($value["isNull"] == "true") {
                return $esq->CreateNullFilter($col);
            }
            else {
                return $esq->CreateNotNullFilter($col);
            }
        }
        return null;
    }
    private static function _getColumnByColumnOrName($column, $esq) {
        if (gettype($column) == "string") {
            return $esq->CreateColumn($column);
        }

        if ($column["type"] == IColumn::ColumnType) {
            $col = $esq->CreateColumn($column["nameInDB"], $column["name"]);
        }
        else if ($column["type"] == IColumn::AggregationColumnType) {

            $col = $esq->CreateAggregationColumn($column["aggregationType"], self::_getColumnByColumnOrName($column["column"], $esq), $column["name"]);
        }
        else if ($column["type"] == IColumn::ArithmeticColumnType) {
            $col = $esq->CreateArithmeticColumn(self::_getColumnByColumnOrName($column["column1"], $esq), self::_getColumnByColumnOrName($column["column2"], $esq), $column["arithmeticOperation"], $column["name"]);
        }
        self::_addColumnConfig($col, $column);
        return $col;
    }
    private static function _addColumnConfig($column, $config) {
        if (isset($config["orderDirection"])) {
            $column->OrderDirection = $config["orderDirection"];
        }
        if (isset($config["orderPosition"])) {
            $column->OrderPosition = $config["orderPosition"];
        }
    }

    static function GetQueryFromCustomObject($object) {
        $type = $object["type"];
        if (strtolower($type) == "insert") {
            $current = new Insert($object["schemaName"], $object["values"]);
        }
        else if (strtolower($type) == "update") {
            $current = new Update($object["schemaName"], $object["values"]);
            $current->Filters = self::_AddFilterToEsq($object["Filters"], $current);
        }
        return $current;
    }
}
