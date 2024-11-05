<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Session extends Model
{
    use HasFactory;

    protected $fillable = [
        'title',
        'description',
        'date',
        'frequency',
        'user_id',
    ];

    /**
     * Get the user that owns the session.
     */

     public function user(){
        return $this->belongsTo(User::class);
     }
}
