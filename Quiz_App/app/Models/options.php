<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class options extends Model
{
    protected $fillable = ['code','Option_value','Is_correct'];
    public function normal_question() {
        return $this->belongsTo(normal_question::class);
    } 
    use HasFactory;
}
