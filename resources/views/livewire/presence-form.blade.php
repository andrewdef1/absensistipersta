
<div>
    {{-- get lokasi input --}}
    <input type="hidden" wire:model="lokasi" id="lokasi" name="lokasi">

{{-- {{ $lokasi }} --}}


    @if ($holiday)
    <div class="alert alert-success">
        <small class="fw-bold">Hari ini adalah hari libur.</small>
    </div>
    @else



        {{-- jika absen pulang sudah dimulai, dan karyawan belum absen masuk dan belum absen pulang --}}
        @if ($attendance->data->is_end && !$data['is_has_enter_today'] && $attendance->data->in_date_range)
        <button class="btn btn-primary px-3 py-2 btn-sm fw-bold d-block w-100" wire:click="sendLateEnterPresence"
            wire:loading.attr="disabled" wire:target="sendLateEnterPresence">Absen Masuk & Pulang Sekaligus (Hanya yang lupa absen masuk!!!)</button>
            <br>
            <textarea class="px-3 pt-2 pb-5 rounded fw-normal block w-100" style="resize: none;" cols="100" placeholder="CATATAN (opsional)" id="catatan" name="catatan" wire:model="catatan"></textarea>
        @endif
<br>


    {{-- jika tidak menggunakan qrcode (button) dan karyawan saat ini tidak menekan tombol izin --}}
    @if (!$attendance->data->is_using_qrcode && !$data['is_there_permission'] && $attendance->data->in_date_range)

    {{-- jika belum absen dan absen masuk sudah dimulai --}}
    @if ($attendance->data->is_start && !$data['is_has_enter_today'] && $attendance->data->in_date_range)
    <button class="btn btn-primary px-3 py-2 btn-sm fw-bold d-block w-100 mb-2" wire:click="sendEnterPresence"
        wire:loading.attr="disabled" wire:target="sendEnterPresence">Masuk</button>
        <textarea class="px-3 pt-2 pb-5 rounded fw-normal block w-100" style="resize: none;" cols="100" placeholder="CATATAN (opsional)" id="catatan" name="catatan" wire:model="catatan"></textarea>
        <br>
    <a href="{{ route('home.permission', $attendance->id) }}"
        class="btn btn-info px-3 py-2 btn-sm fw-bold d-block w-100">Izin</a>
    @endif

    @if ($data['is_has_enter_today'] && $attendance->data->in_date_range)
    <div class="alert alert-success">
        <small class="d-block fw-bold text-success">Anda sudah berhasil mengirim absensi masuk.</small>
    </div>
    @endif

    {{-- jika absen pulang sudah dimulai, dan karyawan sudah absen masuk dan belum absen pulang --}}
    @if ($attendance->data->is_end && $data['is_has_enter_today'] && $data['is_not_out_yet'] && $attendance->data->in_date_range)
    <button class="btn btn-primary px-3 py-2 btn-sm fw-bold d-block w-100" wire:click="sendOutPresence"
        wire:loading.attr="disabled" wire:target="sendOutPresence">Pulang</button>
        <br>
    <textarea class="px-3 pt-2 pb-5 rounded fw-normal block w-100" style="resize: none;" cols="100" placeholder="CATATAN (opsional)" id="catatan" name="catatan" wire:model="catatan"></textarea>
    @endif

    {{-- sudah absen masuk dan absen pulang --}}
    @if ($data['is_has_enter_today'] && !$data['is_not_out_yet'] && $attendance->data->in_date_range)
    <div class="alert alert-success">
        <small class="d-block fw-bold text-success">Anda sudah melakukan absen masuk dan absen pulang.</small>
    </div>
    @endif

    {{-- jika sudah absen masuk dan belum saatnya absen pulang --}}
    @if ($data['is_has_enter_today'] && !$attendance->data->is_end && $attendance->data->in_date_range)
    <div class="alert alert-danger">
        <small class="fw-bold">Belum saatnya melakukan absensi pulang.</small>
    </div>
    @endif
    @endif

    @if($data['is_there_permission'] && !$data['is_permission_accepted'] && $attendance->data->in_date_range)
    <div class="alert alert-info">
        <small class="fw-bold">Permintaan izin sedang diproses (atau masih belum di terima).</small>
    </div>
    @endif

    @if($data['is_there_permission'] && $data['is_permission_accepted'] && $attendance->data->in_date_range)
    <div class="alert alert-success">
        <small class="fw-bold">Permintaan izin sudah diterima.</small>
    </div>
    @endif

    @endif

</div>
@push('script')
<script>

    // script lokasi
const lokasi = document.getElementById('lokasi');
const tottest = document.getElementById('tottest');
if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(successCallback, errorCallback)
}

function successCallback(position){
    document.addEventListener('livewire:load',function ()
        {
            @this.lokasi = position.coords.latitude + "," + position.coords.longitude;
        });
    //lokasi.value = position.coords.latitude + "," + position.coords.longitude;
    var map = L.map('map').setView([position.coords.latitude, position.coords.longitude], 17);
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

var marker = L.marker([position.coords.latitude, position.coords.longitude]).addTo(map);

// var circle = L.circle([position.coords.latitude, position.coords.longitude], {
// var circle = L.circle([-2.5539973734458052, 140.4894031435617], {
//     color: 'grey',
//     fillColor: 'cyan',
//     fillOpacity: 0.5,
//     radius: 150
// }).addTo(map);

marker.bindPopup("Lokasi Saya.").openPopup();

// Define the circle
const circleCenter = L.latLng(-2.5539973734458052, 140.4894031435617); // Replace with your circle center coordinates
const circleRadius = 150; // Replace with your circle radius in meters
const circle = L.circle(circleCenter, {
  radius: circleRadius,
}).addTo(map);

// Define the point
const point = L.latLng(position.coords.latitude, position.coords.longitude); // Replace with your point coordinates

// Check if the point is outside the circle
const distanceToCenter = point.distanceTo(circleCenter);
if (distanceToCenter > circleRadius) {
    swal("PERHATIAN!", "Lokasi Anda Sekarang Masih diluar Radius Kampus!", "error");

} else {
    swal("PERHATIAN!", "Lokasi Dalam Radius Kampus, Silahkan Lakukan Absensi!", "success");
}

}

function errorCallback() {

}
</script>
@endpush
