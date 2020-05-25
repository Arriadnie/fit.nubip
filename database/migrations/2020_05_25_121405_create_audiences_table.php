<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAudiencesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('audiences', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->integer('number')->nullable();
            $table->unsignedInteger('audience_type_id')->nullable();
            $table->unsignedInteger('building_id')->nullable();

            $table->foreign('audience_type_id')
                ->references('id')->on('audience_types')
                ->onUpdate('cascade')->onDelete('set null');
            $table->foreign('building_id')
                ->references('id')->on('buildings')
                ->onUpdate('cascade')->onDelete('cascade');
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
        Schema::dropIfExists('audiences');
    }
}
