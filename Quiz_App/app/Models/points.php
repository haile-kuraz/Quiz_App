<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class points extends Model
{
    protected $table = 'points';
    protected $fillable = ['student_id', 'category_id', 'point',];

    public function student()
    {
        return $this->belongsTo(student::class, 'student_id', 'id');
    }
    public function category()
    {
        return $this->belongsTo(category::class, 'category_id', 'id');
    }
    // Define relationship with the Score model
    public function score()
    {
        return $this->belongsTo(score::class, 'student_id', 'student_id');
    }
    use HasFactory;
}
