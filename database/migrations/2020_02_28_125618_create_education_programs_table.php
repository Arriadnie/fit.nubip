<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateEducationProgramsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('education_programs', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name');
            $table->string('slug')->unique();
            $table->text('description')->nullable();
            $table->text('info_body')->nullable();
            $table->string('image')->nullable();
            $table->integer('order')->default(0);
            $table->integer('education_degree_id')->unsigned()->nullable();
            $table->integer('education_specialty_id')->unsigned()->nullable();
            $table->timestamps();


            $table->foreign('education_degree_id')
                ->references('id')->on('education_degrees')
                ->onUpdate('cascade')->onDelete('set null');
            $table->foreign('education_specialty_id')
                ->references('id')->on('education_specialties')
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
        Schema::dropIfExists('education_programs');
    }
}
