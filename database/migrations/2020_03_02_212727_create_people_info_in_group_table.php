<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePeopleInfoInGroupTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('people_info_in_group', function (Blueprint $table) {
            $table->bigInteger('people_info_id')->unsigned();
            $table->integer('people_info_group_id')->unsigned();
            $table->integer('order')->default(0);

            $table->foreign('people_info_id')
                ->references('id')->on('people_infos')
                ->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('group_id')
                ->references('id')->on('people_info_groups')
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
        Schema::table('people_info_in_group', function (Blueprint $table) {
            //
        });
    }
}
