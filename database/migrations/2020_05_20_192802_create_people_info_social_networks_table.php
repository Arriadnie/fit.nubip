<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePeopleInfoSocialNetworksTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('people_info_social_networks', function (Blueprint $table) {
            $table->bigInteger('people_info_id')->unsigned();
            $table->integer('social_network_id')->unsigned();
            $table->text('value')->nullable();

            $table->foreign('people_info_id')
                ->references('id')->on('people_infos')
                ->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('social_network_id')
                ->references('id')->on('social_networks')
                ->onUpdate('cascade')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('people_info_social_networks');
    }
}
