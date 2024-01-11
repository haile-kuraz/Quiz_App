<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class category extends Model
{
    protected $table = 'categories';

    protected $fillable = ['name', 'Image_url', 'description', 'categoryType'];
    // Default attribute values
    protected $attributes = [
        'Image_url' => "https://is1-ssl.mzstatic.com/image/thumb/Purple126/v4/94/74/da/9474da4e-9a1e-d8ac-39b8-818229b05c47/AppIcon-0-0-1x_U007emarketing-0-0-0-7-0-0-sRGB-0-0-0-GLES2_U002c0-512MB-85-220-0-0.png/1024x1024.jpg", // Replace with your default URL
    ];
    public function normal_questions()
    {
        return $this->hasMany(normal_question::class, 'category_id');
    }
    public function subcategorys()
    {
        return $this->hasMany(subcategory::class);
    }
    public function point()
    {
        return $this->hasOne(points::class, 'category_id', 'id');
    }
    use HasFactory;
}
