<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class broadcast_options extends Model
{
    protected $fillable = ['code', 'Option_value', 'Is_correct'];
    public function broadcast_questions()
    {
        return $this->belongsTo(broadcast_questions::class);
    }
    use HasFactory;
}
