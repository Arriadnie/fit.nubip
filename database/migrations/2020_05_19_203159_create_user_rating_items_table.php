<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use App\Models\Rating\UserRatingItem;

class CreateUserRatingItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_rating_items', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->text('name');
            $table->date('date');
            $table->enum('status', UserRatingItem::$statuses)->default(UserRatingItem::STATUS_IN_PROCESS);
            $table->unsignedInteger('rating_item_id')->nullable();
            $table->unsignedBigInteger('user_id');
            $table->text('comment')->nullable();
            $table->timestamps();


            $table->foreign('rating_item_id')
                ->references('id')->on('rating_items')
                ->onUpdate('cascade')->onDelete('set null');

            $table->foreign('user_id')
                ->references('id')->on('users')
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
        Schema::dropIfExists('user_rating_items');
    }
}
