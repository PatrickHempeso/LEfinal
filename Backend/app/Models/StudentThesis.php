<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class StudentThesis extends Model
{
    protected $table = 'student_thesis';
    protected $primaryKey = 'ThesisID';
    public $incrementing = false;
    protected $keyType = 'string';
    public $timestamps = false;

    // 'DateCreated' has been removed to match your database schema consistency.
    protected $fillable = [
        'ThesisID',
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