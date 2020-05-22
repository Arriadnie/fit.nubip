<?php

namespace App\Integration\Esq;


class AggregationFunction {
    const SUM = 1;
    const COUNT = 2;
    const MAX = 3;
    const MIN = 4;

    static function GetSql($aggregationFunction) {
        switch ($aggregationFunction) {
            case self::SUM:
                return "SUM";
            case self::COUNT:
                return "COUNT";
            case self::MAX:
                return "MAX";
            case self::MIN:
                return "MIN";
        }
    }
}
