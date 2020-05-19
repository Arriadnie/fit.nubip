<?php

namespace App\Integration;

use App\Integration\Base\BaseSyncItem;
use App\Models\Education\Discipline;

class DisciplineSyncItem extends BaseSyncItem
{

    public function updateEntity($item, $localId) {
        $localEntity = Discipline::find($localId);
        $localEntity->name = $item->values->DisciplinesName;
        $localEntity->save();
        return $localEntity;
    }
    public function createEntity($item) {
        $localEntity = Discipline::create([
            'name' => $item->values->DisciplinesName
        ]);
        $trans = [
            'uk' => $item->values->DisciplinesName,
            'en' => $item->values->DisciplinesNameEn
        ];
        $localEntity->setAttributeTranslations('name', $trans, true);
        return $localEntity;
    }



    public function getConfig() {
        return[
            'schemaName' => 'disciplines',
            'allColumn' => false,
            'isDistinct' => true,
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
                        'value' => setting('integration.faculty-id-in-integrated-db')
                    ]
                ]
            ]
        ];
    }
}
