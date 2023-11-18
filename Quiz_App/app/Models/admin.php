<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class admin extends Model
{
    protected $fillable = [
        ' Name',
        'Email',
        'password',
        'phone_number',
        'Image_url'
    ];
    use HasFactory;
}
