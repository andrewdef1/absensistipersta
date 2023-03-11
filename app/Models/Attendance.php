<?php

namespace App\Models;

use Carbon\Carbon;
use DateTime;
use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\Pivot;
use Illuminate\Support\Facades\Date;
use Illuminate\Support\Facades\URL;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use App\Traits\Uuids;

class Attendance extends Model
{
    use HasFactory, Uuids;

    protected $fillable = [
        'title',
        'description',
        'start_time',
        'batas_start_time',
        'end_time',
        'batas_end_time',
        'tanggal_awal',
        'tanggal_akhir',
         'code'
    ];

    protected $appends = ['data'];

    protected function data(): Attribute
    {
        return Attribute::make(
            get: function ($value) {
                $now = now();
                $now_tgl = date("Y-m-d");
                $startTime = Carbon::parse($this->start_time);
                $batasStartTime = Carbon::parse($this->batas_start_time);

                $endTime = Carbon::parse($this->end_time);
                $batasEndTime = Carbon::parse($this->batas_end_time);

                $tanggalAwal = Carbon::parse($this->tanggal_awal);
                $tanggalAkhir = Carbon::parse($this->tanggal_akhir);

                $isHolidayToday = Holiday::query()
                    ->where('holiday_date', now()->toDateString())
                    ->get();

                return (object) [
                    "start_time" => $this->start_time,
                    "batas_start_time" => $this->batas_start_time,
                    "end_time" => $this->end_time,
                    "batas_end_time" => $this->batas_end_time,
                    "tanggal_awal" => $this->tanggal_awal,
                    "tanggal_akhir" => $this->tanggal_akhir,
                    "now" => $now->format("H:i:s"),
                    "now_tgl" => $now->format("dd-mm-yyyy"),
                    "is_start" => $startTime <= $now && $batasStartTime >= $now,
                    "is_end" => $endTime <= $now && $batasEndTime >= $now,
                    "in_date_range" => $tanggalAwal <= $now_tgl && $tanggalAkhir >= $now_tgl,
                    'is_using_qrcode' => $this->code ? true : false,
                    'is_holiday_today' => $isHolidayToday->isNotEmpty()
                ];
            },
        );
    }

    public function scopeForCurrentUser($query, $userPositionId)
    {
        $query->whereHas('positions', function ($query) use ($userPositionId) {
            $query->where('position_id', $userPositionId);
        });
    }

    public function positions()
    {
    return $this->belongsToMany(Position::class)
    ->using(new class () extends Pivot {
        use Uuids;
    });
}

    public function presences()
    {
        return $this->hasMany(Presence::class);
    }
}
