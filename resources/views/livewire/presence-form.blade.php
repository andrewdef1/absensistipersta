<style>
    #map { height: 180px; }
</style>

<div>
    {{-- get lokasi input --}}
    <input type="text" id="lokasi">
    <div class="row mt-2">
        <div class="col">
            <div id="map"></div>
        </div>
    </div>

    @if ($holiday)
    <div class="alert alert-success">
        <small class="fw-bold">Hari ini adalah hari libur.</small>
    </div>
    @else



        {{-- jika absen pulang sudah dimulai, dan karyawan belum absen masuk dan belum absen pulang --}}
        @if ($attendance->data->is_end && !$data['is_has_enter_today'] && $attendance->data->in_date_range)
        <button class="btn btn-primary px-3 py-2 btn-sm fw-bold d-block w-100" wire:click="sendLateEnterPresence"
            wire:loading.attr="disabled" wire:target="sendLateEnterPresence">Masuk (Hanya yang lupa absen masuk!!!)</button>

        @endif
<br>


    {{-- jika tidak menggunakan qrcode (button) dan karyawan saat ini tidak menekan tombol izin --}}
    @if (!$attendance->data->is_using_qrcode && !$data['is_there_permission'] && $attendance->data->in_date_range)

    {{-- jika belum absen dan absen masuk sudah dimulai --}}
    @if ($attendance->data->is_start && !$data['is_has_enter_today'] && $attendance->data->in_date_range)
    <button class="btn btn-primary px-3 py-2 btn-sm fw-bold d-block w-100 mb-2" wire:click="sendEnterPresence"
        wire:loading.attr="disabled" wire:target="sendEnterPresence">Masuk</button>
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
var lokasi = document.getElementById('lokasi');
if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(successCallback, errorCallback)
}

function successCallback(position){
    lokasi.value = position.coords.latitude + "," + position.coords.longitude;
    var map = L.map('map').setView([position.coords.latitude, position.coords.longitude], 17);
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

var marker = L.marker([position.coords.latitude, position.coords.longitude]).addTo(map);

var circle = L.circle([position.coords.latitude, position.coords.longitude], {
    color: 'grey',
    fillColor: 'cyan',
    fillOpacity: 0.5,
    radius: 69
}).addTo(map);
}

function errorCallback() {

}
</script>
@endpush
