<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Event extends Model
{
    use HasFactory;
    protected $fillable = ['title', 'date']; // Add any other fields you need

public function scopeDate($query, $date) {
    return $query->where('date', $date);
}
}
