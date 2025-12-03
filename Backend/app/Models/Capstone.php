<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Capstone extends Model
{
    use HasFactory;

    protected $table = 'capstone';
    protected $primaryKey = 'CapstoneID';
    public $incrementing = false; // string IDs like CP001
    protected $keyType = 'string';
    public $timestamps = false;

    protected $fillable = [
        'CapstoneID',
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
