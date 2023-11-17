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
        Schema::create('normal_questions', function (Blueprint $table) {
            $table->id();
            $table->string('subcategory_name');
            $table->string('category_name');
            $table->text('question');
            $table->text('solution_description');
            $table->enum('difficulty', ['easy', 'medium', 'hard']);
            $table->timestamps();

            //these are the foreign  keys
            $table->foreign('subcategory_name')->references('name')->on('sub_categorys')->onDelete('cascade');
            $table->foreign('category_name')->references('name')->on('categorys')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('normal_question');
    }
};
