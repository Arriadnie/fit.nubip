<?php

namespace App\Http\Controllers\Integration;

use App\Integration\DekanatIntegrationProvider;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use GuzzleHttp\Client;

class IntegrationController extends Controller
{


    public function start() {
        $provider = new DekanatIntegrationProvider();
        $success = $provider->run();

        return redirect()->route("voyager.integration-logs.index")->with([
            'message'    => $success ? __('integration.success-integration') : __('integration.error-integration'),
            'alert-type' => $success ? 'success' : 'error',
        ]);
    }


}
