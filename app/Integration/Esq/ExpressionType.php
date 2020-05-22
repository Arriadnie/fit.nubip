<?php

namespace App\Integration\Esq;


class ExpressionType {
    const AND = 1;
    const OR = 2;

    static function GetSql($expressionType) {
        switch ($expressionType) {
            case self::AND:
                return "AND";
            case self::OR:
                return "OR";
        }
    }
}
