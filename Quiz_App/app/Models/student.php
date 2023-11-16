<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class student extends Model
{
    protected $fillable = ['Name',
    'Email',
    'password',
    'phone_number',
    'image_url'];
    public function score() {
        return $this->hasOne(score::class);
    }
    use HasFactory;
}
