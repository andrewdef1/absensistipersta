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
        Schema::create('permissions', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('user_id')->constrained();
            // $table->foreign('user_id')->constrained();
            $table->uuid('attendance_id')->constrained()->cascadeOnDelete();
            // $table->foreign('attendance_id')->constrained()->cascadeOnDelete();
            $table->string('title');
            $table->string('description', 500);
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
        Schema::dropIfExists('permissions');
    }
};