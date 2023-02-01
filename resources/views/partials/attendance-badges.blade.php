@if($attendance->data->is_holiday_today && $attendance->data->in_date_range)
<span class="badge text-bg-success rounded-pill">Hari Libur</span>
@else

@if ($attendance->data->is_start && $attendance->data->in_date_range)
<span class="badge bg-primary rounded-pill">Jam Masuk</span>
@elseif($attendance->data->is_end && $attendance->data->in_date_range)
<span class="badge text-bg-warning rounded-pill">Jam Pulang</span>
@else
<span class="badge text-bg-danger rounded-pill">Tutup</span>
@endif

@endif
