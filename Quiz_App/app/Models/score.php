<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class score extends Model
{
    protected $fillable = ['student_id', 'broadcast_score', 'points'];

    public function student()
    {
        return $this->belongsTo(student::class);
    }
    use HasFactory;
}
