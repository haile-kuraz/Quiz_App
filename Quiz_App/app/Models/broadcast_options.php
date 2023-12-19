<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class broadcast_options extends Model
{

    protected $table = 'broadcast_options';
    protected $fillable = ['code', 'Question_id', 'Option_value', 'Is_correct'];
    public function broadcast_questions()
    {
        return $this->belongsTo(broadcast_questions::class, 'Question_id');
    }
    use HasFactory;
}
