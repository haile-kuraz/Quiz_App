<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class subcategory extends Model
{

    protected $table = 'sub_categories';

    protected $fillable = ['name', 'Image_url', 'category_id'];
    public function normal_questions()
    {
        return $this->hasMany(normal_question::class);
    }
    public function category()
    {
        return $this->belongsTo(category::class);
    }
    use HasFactory;
}
