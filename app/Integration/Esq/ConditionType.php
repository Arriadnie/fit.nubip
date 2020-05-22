<?php

namespace App\Integration\Esq;


class ConditionType {
    const Equal = 1;
    const NotEqual = 2;
    const More = 3;
    const MoreEqual = 4;
    const Less = 5;
    const LessEqual = 6;

    static function GetSql($conditionType) {
        switch($conditionType) {
            case self::Equal:
                return "=";
            case self::NotEqual:
                return "<>";
            case self::More:
                return ">";
            case self::MoreEqual:
                return ">=";
            case self::Less:
                return "<";
            case self::LessEqual:
                return "<=";
        }
    }
}
