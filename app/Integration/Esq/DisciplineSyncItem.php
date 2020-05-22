<?php

namespace App\Integration;


class DisciplineSyncItem
{
    public function start()
    {
        $executor = new IntegrationExecutor();
        $executor->execute($this->getConfig());
    }

    public function getConfig()
    {
        return [
            'schemaName' => 'disciplidnes',
            'allColumn' => false,
            'columns' => [
                [
                    'type' => 1,
                    'name' => null,
                    'orderDirection' => null,
                    'orderPosition' => null,
                    'nameInDB' => 'id'
                ],
                [
                    'type' => 1,
                    'name' => null,
                    'orderDirection' => null,
                    'orderPosition' => null,
                    'nameInDB' => 'DisciplinesName'
                ],
                [
                    'type' => 1,
                    'name' => null,
                    'orderDirection' => null,
                    'orderPosition' => null,
                    'nameInDB' => 'DisciplinesNameEn'
                ]
            ],
            'Filters' => [
                'expressionType' => 1,
                'filters' => [
                    'f17968837448321007' => [
                        'type' => 1,
                        'column' => [
                            'type' => 1,
                            'name' => null,
                            'orderDirection' => null,
                            'orderPosition' => null,
                            'nameInDB' => '[curriculumdiscipline:id_disciplines:id].id_Curriculum(curriculum).id_faculty'
                        ],
                        'conditionType' => 1,
                        'value' => 1
                    ]
                ]
            ]
        ];
    }
}
