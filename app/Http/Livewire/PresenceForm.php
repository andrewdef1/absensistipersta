<?php

namespace App\Http\Livewire;

use App\Models\Attendance;
use App\Models\Presence;
use Livewire\Component;

class PresenceForm extends Component
{
    public Attendance $attendance;
    public $holiday;
    public $data;

    public function mount(Attendance $attendance)
    {
        $this->attendance = $attendance;
    }

    // NOTED: setiap method send presence agar lebih aman seharusnya menggunakan if statement seperti diviewnya

    public function sendEnterPresence()
    {
        if ($this->attendance->data->is_start && !$this->attendance->data->is_using_qrcode) { // sama (harus) dengan view
            $checkLocation=geoip()->getLocation($_SERVER['REMOTE_ADDR']);
            Presence::create([
                "user_id" => auth()->user()->id,
                "attendance_id" => $this->attendance->id,
                "presence_date" => now()->toDateString(),
                "presence_enter_time" => now()->toTimeString(),
                "presence_out_time" => null,
                "latitude_masuk" => $checkLocation->lat,
                "longitude_masuk" => $checkLocation->lon,
                "latitude_keluar" => null,
                "longitude_keluar" => null
            ]);

            // untuk refresh if statement
            $this->data['is_has_enter_today'] = true;
            $this->data['is_not_out_yet'] = true;

            return $this->dispatchBrowserEvent('showToast', ['success' => true, 'message' => "Atas nama '" . auth()->user()->name . "' berhasil melakukan absensi masuk."]);
        }

        if (now() > $this->attendance->data->batas_start_time && !$this->attendance->data->is_using_qrcode)  {
            $checkLocation=geoip()->getLocation($_SERVER['REMOTE_ADDR']);
            Presence::create([
                "user_id" => auth()->user()->id,
                "attendance_id" => $this->attendance->id,
                "presence_date" => now()->toDateString(),
                "presence_enter_time" => 'Anda Terlambat',
                "presence_out_time" => null,
                "latitude_masuk" => $checkLocation->lat,
                "longitude_masuk" => $checkLocation->lon,
                "latitude_keluar" => null,
                "longitude_keluar" => null
            ]);

            // untuk refresh if statement
            $this->data['is_has_enter_today'] = true;
            $this->data['is_not_out_yet'] = true;

            return $this->dispatchBrowserEvent('showToast', ['success' => true, 'message' => "Atas nama '" . auth()->user()->name . "' terlambat melakukan absensi masuk."]);
        }
    }

    public function sendOutPresence()
    {
        // jika absensi sudah jam pulang (is_end) dan tidak menggunakan qrcode (kebalikan)
        if (!$this->attendance->data->is_end && $this->attendance->data->is_using_qrcode) // sama (harus) dengan view
            return false;

            $checkLocation=geoip()->getLocation($_SERVER['REMOTE_ADDR']);
            $presence = Presence::query()
                ->where('user_id', auth()->user()->id)
                ->where('attendance_id', $this->attendance->id)
                ->where('presence_date', now()->toDateString())
                ->where('presence_out_time', null)
                ->first();

            if (!$presence && !$this->attendance->data->is_start && !$this->attendance->data->is_using_qrcode) { // sama (harus) dengan view

                Presence::create([
                    "user_id" => auth()->user()->id,
                    "attendance_id" => $this->attendance->id,
                    "presence_date" => now()->toDateString(),
                    "presence_enter_time" => null,
                    "presence_out_time" => now()->toTimeString(),
                    "latitude_masuk" => null,
                    "longitude_masuk" => null,
                    "latitude_keluar" => $checkLocation->lat,
                    "longitude_keluar" => $checkLocation->lon
                ]);
                $this->data['is_not_out_yet'] = false;
                $this->data['is_has_enter_today'] = false;
                return $this->dispatchBrowserEvent('showToast', ['success' => true, 'message' => "Atas nama '" . auth()->user()->name . "' berhasil melakukan absensi pulang."]);
            }

        if (!$presence) // hanya untuk sekedar keamanan (kemungkinan)
            return $this->dispatchBrowserEvent('showToast', ['success' => false, 'message' => "Terjadi masalah pada saat melakukan absensi."]);




    // untuk refresh if statement
    $this->data['is_not_out_yet'] = false;
    $presence->update(['presence_out_time' => now()->toTimeString()]);
    $presence->update(['latitude_keluar' => $checkLocation->lat]);
    $presence->update(['longitude_keluar' => $checkLocation->lon]);
    return $this->dispatchBrowserEvent('showToast', ['success' => true, 'message' => "Atas nama '" . auth()->user()->name . "' berhasil melakukan absensi pulang."]);

    }


    public function render()
    {
        return view('livewire.presence-form');
    }
}