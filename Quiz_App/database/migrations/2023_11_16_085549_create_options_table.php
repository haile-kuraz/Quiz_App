<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('options', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('Question_id');
            $table->char('code', 1);
            $table->string('Option_value');
            $table->boolean('Is_correct')->default(0);
            $table->timestamps();
            //the bellow is for forigne key
            $table->foreign('Question_id')->references('id')->on('normal_questions')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('options');
    }
};
