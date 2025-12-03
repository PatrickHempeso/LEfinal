<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StudentCapstone extends Model
{
    protected $table = 'student_capstone';
    protected $primaryKey = 'CapstoneID';
    public $incrementing = false;
    protected $keyType = 'string';
    public $timestamps = false;

    // 'DateCreated' has been removed to match the current database schema
    protected $fillable = [
        'CapstoneID',
        'StudentID',
        'Title',
        'Authors',
        'Abstract',
        'Keywords',
        'Adviser',
        'YearPublished',
        'DocumentID',
    ];
}