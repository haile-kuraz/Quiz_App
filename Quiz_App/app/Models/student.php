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
