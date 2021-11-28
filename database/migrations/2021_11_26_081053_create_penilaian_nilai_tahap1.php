<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePenilaianNilaiTahap1 extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('t_penilaian_nilai_tahap1', function (Blueprint $table) {
            $table->string('tahap1_id',50)->primary();
            $table->string('penilaian_assessment_id',50)->charset('latin1')->collation('latin1_swedish_ci');
            $table->string('mahasiswa_dosen_id',50)->charset('latin1')->collation('latin1_swedish_ci');
            $table->decimal('nilai_awal',25,2)->default(0);
            $table->decimal('persen',25,2)->default(0);
            $table->decimal('nilai_akhir',25,2)->default(0);
            $table->string('user_record',250)->nullable();
            $table->string('user_modified',250)->nullable();
            $table->timestamp('dt_record');
            $table->datetime('dt_modified');
            
            $table->foreign('penilaian_assessment_id')->references('id')->on('t_penilaian_assessment');
            $table->foreign('mahasiswa_dosen_id')->references('id')->on('m_dosen_mahasiswa');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('t_penilaian_nilai_tahap1');
    }
}
