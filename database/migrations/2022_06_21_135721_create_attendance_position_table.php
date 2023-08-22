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
        Schema::create('attendance_position', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('attendance_id')->constrained()->cascadeOnDelete();
            $table->uuid('position_id')->constrained();
            // $table->foreign('attendance_id')->constrained()->cascadeOnDelete();
            // $table->foreign('position_id')->constrained();
            $table->timestamps();

            $table->foreign('attendance_id')->references('id')->on('attendances');
            $table->foreign('position_id')->references('id')->on('positions');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('attendance_position');
    }
};