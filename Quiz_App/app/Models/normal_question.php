<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class normal_question extends Model
{

    protected $fillable = ['question', 'solution_description', 'difficulty', 'subcategory_id', 'category_id'];

    public function students()
    {
        return $this->belongsToMany(student::class);
    }
    public function options()
    {
        return $this->hasMany(options::class);
    }
    public function subcategory()
    {
        return $this->belongsTo(subcategory::class);
    }
    public function category()
    {
        return $this->belongsTo(category::class);
    }
    use HasFactory;
}
