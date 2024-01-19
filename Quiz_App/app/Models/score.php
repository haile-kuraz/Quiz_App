<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class score extends Model
{
    protected $fillable = ['student_id', 'broadcast_score'];

    public function student()
    {
        return $this->belongsTo(student::class, 'student_id', 'id');
    }
    // Define relationship with the Point model
    public function points()
    {
        return $this->hasMany(points::class, 'student_id', 'student_id');
    }

    use HasFactory;
}
