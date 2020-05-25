<?php

namespace App\Integration;

use App\Integration\Base\BaseSyncItem;
use App\User;

class StudentUserSyncItem extends BaseSyncItem
{

    public function updateEntity($item, $localId) {
        $localEntity = User::find($localId);
        $values = $item->values;
        $name = $values->LastName . ' ' . $values->FirstName . ' ' . $values->MiddleName;
        $groupId = $this->getLocalGroupId($values->id_StudyGroup);
        $localEntity->name = $name;
        $localEntity->credit_note_number = $values->NomZalikNote;
        if (isset($values->Birthday) && !is_null($values->Birthday) && !empty($values->Birthday)) {
            $localEntity->birthday = static::_getCorrectDate($values->Birthday);
        }
        if ($groupId != null) {
            $localEntity->group_id = $groupId;
        }
        $localEntity->save();
        return $localEntity;
    }

    public function createEntity($item) {

        $values = $item->values;
        $name = $values->LastName . ' ' . $values->FirstName . ' ' . $values->MiddleName;
        $groupId = $this->getLocalGroupId($values->id_StudyGroup);
        $localEntity = new User([
            'name' => $name,
            'credit_note_number' => $item->values->NomZalikNote,
            'role_id' => User::STUDENT_ROLE_ID
        ]);
        if (isset($values->Birthday) && !is_null($values->Birthday) && !empty($values->Birthday)) {
            $localEntity->birthday = static::_getCorrectDate($values->Birthday);
        }
        if ($groupId != null) {
            $localEntity->group_id = $groupId;
        }
        $localEntity->avatar = setting('users.default-avatar');
        $localEntity->save();
        return $localEntity;
    }
    private static function _getCorrectDate($date) {
        $dateComponents = explode(".",$date);
        if ($dateComponents[2] === '' || $dateComponents[2] === '0000') {
            return null;
        }
        return $dateString = $dateComponents[2] . "-" . $dateComponents[1] . "-" . $dateComponents[0];
    }

    private function getLocalGroupId($remoteId) {
        return $this->getLocalIdByRemote('App\Integration\StudentGroupSyncItem', $remoteId);
    }



    public function getConfig() {
        $columns = ['id', 'LastName', 'FirstName', 'MiddleName', 'Birthday', 'id_StudyGroup', 'NomZalikNote'];

        $config = [
            'schemaName' => 'student',
            'allColumn' => false,
            'columns' => [],
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
                    ],
                    'f17968837448321004' => [
                        'type' => 1,
                        'column' => [
                            'type' => 1,
                            'name' => null,
                            'orderDirection' => null,
                            'orderPosition' => null,
                            'nameInDB' => 'StudentStatus'
                        ],
                        'conditionType' => 1,
                        'value' => 2
                    ],
                    'f17968837448321008' => [
                        'type' => 1,
                        'column' => [
                            'type' => 1,
                            'name' => null,
                            'orderDirection' => null,
                            'orderPosition' => null,
                            'nameInDB' => 'id_StudyGroup'
                        ],
                        'conditionType' => 1,
                        'value' => 37
                    ]
                ]
            ]
        ];
        foreach ($columns as $key => $column) {
            array_push($config['columns'], [
                'type' => 1,
                'name' => null,
                'orderDirection' => null,
                'orderPosition' => null,
                'nameInDB' => $column
            ]);
        }
        return $config;
    }
}
