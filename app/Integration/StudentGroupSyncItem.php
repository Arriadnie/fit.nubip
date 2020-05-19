<?php

namespace App\Integration;

use App\Integration\Base\BaseSyncItem;
use App\Models\Education\Group;

class StudentGroupSyncItem extends BaseSyncItem
{

    public function updateEntity($item, $localId) {
        $localEntity = Group::find($localId);
        $localEntity->name = $item->values->StudyGroupName;
        $localEntity->save();
        return $localEntity;
    }
    public function createEntity($item) {
        $localEntity = Group::create([
            'name' => $item->values->StudyGroupName
        ]);
        return $localEntity;
    }



    public function getConfig() {
        return[
            'schemaName' => 'studygroup',
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
                    'nameInDB' => 'StudyGroupName'
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
                            'nameInDB' => 'id_faculty'
                        ],
                        'conditionType' => 1,
                        'value' => setting('integration.faculty-id-in-integrated-db')
                    ]
                ]
            ]
        ];
    }
}
