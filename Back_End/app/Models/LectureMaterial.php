<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LectureMaterial extends Model
{
    use HasFactory;

    protected $fillable = [
        'lecture_title',
        'lecture_number',
        'file_path',
    ];

}
