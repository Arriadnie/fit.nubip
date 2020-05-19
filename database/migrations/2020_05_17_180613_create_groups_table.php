<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateGroupsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('groups', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->unsignedInteger('introduction_year')->nullable();
            $table->unsignedBigInteger('starosta_id')->unsigned()->nullable();
            $table->integer('education_program_id')->unsigned()->nullable();
            $table->timestamps();


            $table->foreign('starosta_id')
                ->references('id')->on('users')
                ->onUpdate('cascade')->onDelete('set null');
            $table->foreign('education_program_id')
                ->references('id')->on('education_programs')
                ->onUpdate('cascade')->onDelete('set null');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('groups');
    }
}
