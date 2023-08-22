<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('presences', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('user_id')->constrained();
            // $table->foreign('user_id')->constrained();
            // $table->foreign('attendance_id')->constrained()->cascadeOnDelete();
            $table->uuid('attendance_id')->constrained()->cascadeOnDelete();
            $table->date("presence_date");
            $table->time("presence_enter_time");
            $table->time("presence_out_time")->nullable();
            $table->string("lokasi_masuk")->nullable();
            $table->string("lokasi_pulang")->nullable();
            $table->timestamps();

            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('attendance_id')->references('id')->on('attendances');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('presences');
    }
};