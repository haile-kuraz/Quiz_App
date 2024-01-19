<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Notifications\Notifiable;


class student extends Model
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'students';
    protected $fillable = [
        'Name',
        'Email',
        'password',
        'phone_number',
        'Image_url'
    ];
    public function score()
    {
        return $this->hasOne(score::class, 'student_id', 'id');
    }
    public function points()
    {
        return $this->hasMany(points::class, 'student_id', 'id');
    }

    use HasFactory;
}
