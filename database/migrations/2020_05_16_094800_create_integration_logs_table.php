<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use App\Integration\Base\Models\IntegrationLog;

class CreateIntegrationLogsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('integration_logs', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->dateTime('datetime')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->enum('status', IntegrationLog::$statuses);
            $table->text('message');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('integration_logs');
    }
}
