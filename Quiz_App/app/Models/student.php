<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class student extends Model
{
    protected $fillable = [
        'Name',
        'Email',
        'password',
        'phone_number',
        'image_url'
    ];
    public function score()
    {
        return $this->hasOne(score::class);
    }
    public function normal_questions()
    {
        return $this->belongsToMany(normal_question::class);
    }
    public function broadcast_questions()
    {
        return $this->belongsToMany(broadcast_questions::class);
    }
    use HasFactory;
}
