<?php

namespace App\Integration\Base\Models;

use Illuminate\Database\Eloquent\Model;

class SysSyncMetaData extends Model
{
    protected $fillable = ['model_name', 'local_id', 'remote_id'];
}
