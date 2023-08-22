<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\Uuids;

class Role extends Model
{
    use HasFactory, Uuids;

    protected $fillable = ['name'];
}