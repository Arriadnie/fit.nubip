<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use App\Models\Schedule\Lesson;

class CreateLessonsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('lessons', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->integer('position')->default(1);
            $table->enum('frequency', Lesson::$frequencies)->default(Lesson::FREQUENCY_FULL);
            $table->unsignedInteger('day_id');
            $table->unsignedInteger('discipline_id');
            $table->unsignedInteger('audience_id')->nullable();
            $table->unsignedInteger('lesson_type_id')->nullable();
            $table->unsignedInteger('period_id');
            $table->timestamps();

            $table->foreign('day_id')
                ->references('id')->on('days')
                ->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('discipline_id')
                ->references('id')->on('disciplines')
                ->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('audience_id')
                ->references('id')->on('audiences')
                ->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('lesson_type_id')
                ->references('id')->on('lesson_types')
                ->onUpdate('cascade')->onDelete('set null');
            $table->foreign('period_id')
                ->references('id')->on('periods')
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
        Schema::dropIfExists('lessons');
    }
}
