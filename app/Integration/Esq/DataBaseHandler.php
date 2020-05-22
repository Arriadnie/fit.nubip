<?php

namespace App\Integration\Esq;


class DataBaseHandler {
    static function GetCollectionByQuery($queryText) {
        $connection = Connection::getConnection();

        if ($connection->connect_error) {
            throw new Exception("Connection failed: " . $connection->connect_error);
        }

        $result = $connection->query($queryText);

        if (!$result) {
            $connection->close();
            throw new Exception("Query execute error!");
        }
        $data = [];
        for ($i = 0; $i < $result->num_rows; $i++) {
            $data[$i] = $result->fetch_assoc();
        }
        $connection->close();
        return $data;
    }

    static function ExecuteQuery($queryText) {
        $connection = Connection::getConnection();

        if ($connection->connect_error) {
            throw new Exception("Connection failed: " . $connection->connect_error);
        }

        $result = $connection->query($queryText);

        if (!$result) {
            $connection->close();
            throw new Exception("Query execute error!" . $queryText);
        }
        $connection->close();
        return true;
    }
}
