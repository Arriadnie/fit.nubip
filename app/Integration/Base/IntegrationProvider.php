<?php

namespace App\Integration\Base;

use App\Integration\Base\Models\IntegrationLog;
use App\Integration\Base\Models\SysSyncMetaData;

class IntegrationProvider
{
    private $dataServiceUrl;

    function __construct($dataServiceUrl)
    {
        $this->dataServiceUrl = $dataServiceUrl;
    }

    public function run()
    {

        $executor = new IntegrationExecutor($this->dataServiceUrl);
        $success = true;
        foreach ($this->getSyncItems() as $key => $syncItemModel) {
            $syncItem = app($syncItemModel);
            $response = $executor->execute($syncItem->getConfig());
            if ($response == null) {
                $success = false;
                continue;
            }
            $collection = $response->collection;
            $index = 0;
            foreach ($collection as $key => $item) {
                $result = $this->saveItem($syncItemModel, $syncItem, $item);
                if (!$result) {
                    $success = false;
                }
                if (++$index > 5) {
                    break;
                }
            }
        }
        IntegrationLog::create([
            'status' => $success ? IntegrationLog::STATUS_SUCCESS : IntegrationLog::STATUS_ERROR,
            'message' => $success ? __('integration.success-integration') : __('integration.error-integration')
        ]);
        return $success;
    }

    public function saveItem($syncItemModel, $syncItem, $item)
    {
        try {
            $localId = $syncItem->getLocalIdByRemote($syncItemModel, $item->values->id);
            $newLocalId = $syncItem->saveItem($item, $localId);
            if ($localId == null) {
                SysSyncMetaData::create([
                    'model_name' => $syncItemModel,
                    'remote_id' => $item->values->id,
                    'local_id' => $newLocalId
                ]);
            }
            return true;
        } catch (\Exception $ex) {
            IntegrationLog::create([
                'status' => IntegrationLog::STATUS_ERROR,
                'message' => "Error on save - " . $ex->getMessage()
            ]);
            return false;
        }
    }


    public function getSyncItems() {
        return [];
    }
}
