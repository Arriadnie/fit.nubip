<?php

namespace App\Integration\Esq;


class ArithmeticOperation {
    const SUM = 1;
    const SUBTRACT = 2;
    const MULTIPLICATION = 3;
    const DEVIDE = 4;

    static function GetSql($arithmeticOperation) {
        switch ($arithmeticOperation) {
            case self::SUM:
                return "+";
            case self::SUBTRACT:
                return "-";
            case self::MULTIPLICATION:
                return "*";
            case self::DEVIDE:
                return "/";
        }
    }
}
