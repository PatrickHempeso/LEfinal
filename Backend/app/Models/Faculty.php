<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;

class Faculty extends Model
{
    use HasApiTokens;

    protected $table = 'faculty';
    protected $primaryKey = 'FacultyID';
    public $timestamps = false;

    protected $fillable = [
        'FirstName',
        'LastName',
        'LoginDetails',   // email
        'Password',       // plaintext password
        'Role',
    ];
}

