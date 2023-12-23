<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class broadcast_questions extends Model
{
    protected $table = 'broadcast_questions';
    protected $fillable = ['Question', 'description', 'dateofLive', 'start_time', 'end_time'];
    protected $dates = [
        'start_time', 'end_time', 'dateofLive'
    ];
    public function students()
    {
        return $this->belongsToMany(student::class);
    }
    public function broadcast_options()
    {
        return $this->hasMany(broadcast_options::class, 'Question_id');
    }
    use HasFactory;
}
