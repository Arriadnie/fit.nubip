<?php

namespace App\Integration\Base;

use App\Integration\Base\Models\IntegrationLog;
use GuzzleHttp\Client;

class IntegrationExecutor
{
    private $dataServiceUrl;

    function __construct($dataServiceUrl)
    {
        $this->dataServiceUrl = $dataServiceUrl;
    }

    public function execute($config)
    {
        $client = new Client([
            'timeout' => 5.0,
        ]);
        try {
            $response = $client->request('GET', $this->dataServiceUrl, [
                'query' => [
                    'method' => 'getEntityCollection',
                    'esq' => $config
                ]
            ]);

            if ($response->getStatusCode() != 200) {
                return;
            }
            $body = $response->getBody();
            $responseObject = json_decode($body->read($body->getSize()));
            if (!$responseObject->success) {
                throw new \Exception($responseObject->ErrorMessage);
            }
            return $responseObject;
        }
        catch (\Exception $ex) {
            $message = "Request error: ";
            if ($ex->getCode() == 404) {
                $message .= "Not fount web service on url \"" . $this->dataServiceUrl . "\"";
            } else {
                $message .= $ex->getMessage();
            }

            IntegrationLog::create([
                'status' => IntegrationLog::STATUS_ERROR,
                'message' => $message
            ]);
            return null;
        }
    }
}
