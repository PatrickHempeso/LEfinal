<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
    protected $table = 'documents';
    protected $primaryKey = 'DocumentID';
    public $incrementing = false; // string IDs like DC001
    protected $keyType = 'string';
    public $timestamps = false;

    protected $fillable = [
        'DocumentID',
        'Title',
        'Keywords',
        'Authors',
        'YearPublished',
        'Abstract',
    ];
}
