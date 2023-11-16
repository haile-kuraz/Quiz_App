<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class broadcast_questions extends Model
{
    protected $fillable = ['Question','description','dateofLive','timeofLive'];
    public function students() {
        return $this->belongsToMany(student::class);
    }
    use HasFactory;
}
