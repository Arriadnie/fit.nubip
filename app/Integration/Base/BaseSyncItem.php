<?php

namespace App\Integration\Base;

use App\Integration\Base\ConditionType;
use App\Integration\Base\Models\SysSyncMetaData;
use GuzzleHttp\Client;
use GuzzleHttp\Psr7\Request;

class BaseSyncItem
{
    public function saveItem($item, $localId)
    {
        $localEntity = null;
        if (!is_null($localId)) {
            $localEntity = $this->updateEntity($item, $localId);
        } else {
            $localEntity = $this->createEntity($item);
        }
        return !is_null($localEntity) ? $localEntity->id : null;
    }
    public function updateEntity($item, $localId) {

    }
    public function createEntity($item) {

    }

    public function getLocalIdByRemote($modelName, $remoteId) {
        $syncObject = SysSyncMetaData::where('model_name', '=', $modelName)->where('remote_id', '=', $remoteId)->first();
        return $syncObject != null ? $syncObject->local_id : null;
    }

}
