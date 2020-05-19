<?php

namespace App\Integration;

use App\Integration\Base\IntegrationProvider;

class DekanatIntegrationProvider extends IntegrationProvider
{

    function __construct()
    {
        parent::__construct(setting('integration.integration-data-service-url'));
    }

    public function getSyncItems() {
        return [
            'App\Integration\DisciplineSyncItem',
            'App\Integration\StudentGroupSyncItem',
            'App\Integration\StudentUserSyncItem',
        ];
    }
}
