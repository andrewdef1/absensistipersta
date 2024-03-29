<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Traits\Uuids;

class Presence extends Model
{
    use HasFactory, Uuids;

    protected $table = "presences";
    protected $guarded = ['id'];
    // protected $dates = ['presence_date'];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
