<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Thesis extends Model
{
    use HasFactory;

    protected $table = 'thesis';
    protected $primaryKey = 'ThesisID';
    public $incrementing = false; // string IDs like TH001
    protected $keyType = 'string';
    public $timestamps = false;

    protected $fillable = [
        'ThesisID',
        'StudentID',
        'Title',
        'Abstract',
        'Keywords',
        'Authors',
        'Adviser',
        'YearPublished',
        'DocumentID',
        'DateCreated'
    ];
}
