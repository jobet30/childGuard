<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Attendance extends Model
{
    use HasFactory;


    protected $fillable = [
        'user_id',
        'session_id',
        'status',
    ];

    /**
     * Get the user that owns the attendance record.
     */

     public function user(){
        return $this->belongsTo(User::class);
     }

     /**
      * Get the session that the attendance record belongs to.
      */

      public function sessions(){
        return $this->hasMany(Session::class);
      }
}
