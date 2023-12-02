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
        $default = "https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/94/74/da/9474da4e-9a1e-d8ac-39b8-818229b05c47/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/1024x1024.jpg";
        Schema::create('sub_categories', function (Blueprint $table) use ($default) {
            $table->id();
            $table->string('name');
            $table->unsignedBigInteger('category_id');
            $table->string('Image_url')->nullable()->default($default);
            $table->timestamps();
            //the following is forigne key
            $table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sub_categories');
    }
};
