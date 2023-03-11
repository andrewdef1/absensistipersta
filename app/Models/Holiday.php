<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\Uuids;

class Holiday extends Model
{
    use HasFactory, Uuids;

    protected $table = 'holidays';
    protected $fillable = ['title', 'description', 'holiday_date'];
}