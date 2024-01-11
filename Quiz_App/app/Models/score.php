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
    use HasFactory;
}
