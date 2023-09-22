<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
{
    Schema::create('enrollment_students', function (Blueprint $table) {
        $table->id();
        $table->string('name');
        $table->integer('age');
        $table->string('phone');
        $table->string('address');
        $table->string('selected_class');
        $table->string('selected_gender');
        $table->date('birth_date');
        $table->string('father_name')->nullable();
        $table->string('father_national_id')->nullable();
        $table->string('father_education')->nullable();
        $table->string('father_mobile')->nullable();
        $table->string('father_job')->nullable();
        $table->decimal('father_income', 10, 2)->nullable();
        $table->string('mother_name')->nullable();
        $table->string('mother_national_id')->nullable();
        $table->string('mother_education')->nullable();
        $table->string('mother_mobile')->nullable();
        $table->string('mother_job')->nullable();
        $table->decimal('mother_income', 10, 2)->nullable();
        $table->timestamps();
    });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('enrollment_students');
    }
};
