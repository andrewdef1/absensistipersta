<?php

namespace App\Http\Livewire;

use App\Models\Position;
use Livewire\Component;

class AttendanceAbstract extends Component
{
    public $attendance;
    public $positions;
    public $position_ids = [];

    protected $rules = [
        'attendance.title' => 'required|string|min:6',
        'attendance.description' => 'required|string|max:500',
        'attendance.start_time' => 'required|date_format:H:i',
        'attendance.batas_start_time' => 'required|date_format:H:i|after:start_time',
        'attendance.end_time' => 'required|date_format:H:i',
        'attendance.batas_end_time' => 'required|date_format:H:i|after:end_time',
        'attendance.tanggal_awal' => 'required',
        'attendance.tanggal_akhir' => 'required',
        'attendance.code' => 'sometimes|nullable|boolean',
        'position_ids' => 'required|array',
        "position_ids.*"  => "required|distinct|string",
    ];

    public function mount()
    {

        $this->positions = Position::query()->select(['id', 'name'])->get();
    }
}
