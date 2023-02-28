<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="shortcut icon" href="{{ URL::asset('/img/logostiper.ico') }}" />
    <link rel="icon" href="{{ URL::asset('/img/logostiper.ico') }}" type="image/x-icon"/>
    <link href="https://fonts.googleapis.com/css2?family=Tilt+Neon" rel="stylesheet">
    <style>
    #clock {
        padding-top:25px;
        font-size:34px;
        font-weight: bold;
        font-family: 'Tilt Neon', sans-serif;
    }
    #dateclock {
        font-size:24px;
        font-family: 'Tilt Neon', sans-serif;
    }
    </style>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.css">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.3/dist/leaflet.css"/>
     <!-- Make sure you put this AFTER Leaflet's CSS -->
    <script src="https://unpkg.com/leaflet@1.9.3/dist/leaflet.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="https://cdn.lordicon.com/ritcuqlt.js"></script>
    <script>
         function updateTime() {
        var daysOfWeek = ['Minggu', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jum\'at', 'Sabtu'];
        var monthsOfYear = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];
        var now = new Date();
        var dayOfWeek = daysOfWeek[now.getDay()];
        var monthOfYear = monthsOfYear[now.getMonth()];
        var year = now.getFullYear();
        var dateNumber  = now.getDate();
        var hours = now.getHours() > 12 ? now.getHours() - 12 : now.getHours();
        var meridiem = now.getHours() >= 12 ? 'PM' : 'AM';
        var minutes = now.getMinutes().toString().padStart(2, '0');
        var seconds = now.getSeconds().toString().padStart(2, '0');
        var timeString =  hours + ':' + minutes + ':' + seconds + ' ' + meridiem;
        var dateString =  '(' + dayOfWeek + ', ' + dateNumber  + ' ' + monthOfYear + ' ' + year + ')';
        document.getElementById('clock').innerHTML = timeString;
        document.getElementById('dateclock').innerHTML = dateString;
    }

    setInterval(updateTime, 1000);
    </script>
    @include('partials.styles')
    @stack('style')

    <title>{{ $title }} | STIPER STA JAYAPURA</title>
</head>

<body>

    <x-toast-container />

    @yield('base')

    @include('partials.scripts')
    @stack('script')

</body>

</html>
