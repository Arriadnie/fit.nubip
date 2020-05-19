<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddEducationColumnsToUsers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {

            $table->date('birthday')->nullable();
            $table->unsignedInteger('group_id')->nullable();
            $table->string('credit_note_number')->nullable();
            $table->string('email')->nullable();
            $table->string('password')->nullable();

            $table->foreign('group_id')
                ->references('id')->on('groups')
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
        Schema::table('users', function (Blueprint $table) {
            //
        });
    }
}
