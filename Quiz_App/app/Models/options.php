<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class options extends Model
{
    protected $table = 'options';
    protected $fillable = ['code', 'Option_value', 'Is_correct', 'Question_id'];
    public function normal_question()
    {
        return $this->belongsTo(normal_question::class, 'Question_id');
    }
    use HasFactory;
}
