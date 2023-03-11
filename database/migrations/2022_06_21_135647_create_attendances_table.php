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
        Schema::create('attendances', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('title');
            $table->string('description', 500);
            $table->time('start_time'); // mulai absen masuk
            $table->time('batas_start_time'); // akhir absen masuk
            $table->time('end_time'); // mulai absen pulang
            $table->time('batas_end_time'); // akhir absen pulang
            $table->date('tanggal_awal')->nullable();
            $table->date('tanggal_akhir')->nullable();
            $table->string('code')->nullable(); // for qrcode kalau kosong berarti hanya pakai button
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('attendances');
    }
};
