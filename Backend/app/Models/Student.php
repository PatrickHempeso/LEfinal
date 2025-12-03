<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Sanctum\HasApiTokens;

class Student extends Authenticatable
{
    use HasApiTokens;

    protected $table = 'student';
    protected $primaryKey = 'StudentID';
    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'StudentID', 'FirstName', 'LastName', 'Email', 'LoginDetails', 'Program', 'ProgramType'
    ];

    protected $hidden = ['LoginDetails'];
}
