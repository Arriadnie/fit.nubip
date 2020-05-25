<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAudienceLessonTypesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('audience_lesson_types', function (Blueprint $table) {
            $table->unsignedInteger('audience_type_id');
            $table->unsignedInteger('lesson_type_id');

            $table->foreign('audience_type_id')
                ->references('id')->on('audience_types')
                ->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('lesson_type_id')
                ->references('id')->on('lesson_types')
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
        Schema::dropIfExists('audience_lesson_types');
    }
}
