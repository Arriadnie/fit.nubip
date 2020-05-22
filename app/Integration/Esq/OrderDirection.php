<?php

namespace App\Integration\Esq;


class OrderDirection {
    const ASC = 1;
    const DESC = 2;

    static function GetSql($expressionType) {
        switch ($expressionType) {
            case self::ASC:
                return "ASC";
            case self::DESC:
                return "DESC";
        }
    }
}
