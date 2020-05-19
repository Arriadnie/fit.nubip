<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSysSyncMetaDataTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sys_sync_meta_data', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('model_name');
            $table->unsignedBigInteger('local_id');
            $table->unsignedBigInteger('remote_id');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sys_sync_meta_data');
    }
}
