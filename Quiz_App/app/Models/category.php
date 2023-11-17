<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class category extends Model
{
    protected $fillable = ['name', 'Image_url', 'description'];
    public function normal_questions()
    {
        return $this->hasMany(normal_question::class);
    }
    public function subcategorys()
    {
        return $this->hasMany(subcategory::class);
    }
    use HasFactory;
}
