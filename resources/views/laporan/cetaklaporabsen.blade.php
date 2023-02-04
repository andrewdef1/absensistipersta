<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <title> Cetak Laporan Absensi - {{ config('app.name') }}</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <link rel="shortcut icon" href="{{ URL::asset('/img/logostiper.ico') }}" />
    <link rel="icon" href="{{ URL::asset('/img/logostiper.ico') }}" type="image/x-icon"/>
    <!-- Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">
    <!-- Styles -->

    @livewireStyles
    <!-- Scripts -->
    {{-- <script src="{{ mix('js/app.js') }}" defer></script> --}}
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    {{-- <link rel="stylesheet" href="/assets/plugins/fontawesome-free/css/all.min.css"> --}}
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Tempusdominus Bootstrap 4 -->
    {{-- <link rel="stylesheet" href="/assets/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="/assets/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
    <!-- JQVMap -->
    <link rel="stylesheet" href="/assets/plugins/jqvmap/jqvmap.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="/assets/dist/css/adminlte.min.css">
    <!-- overlayScrollbars -->
    <link rel="stylesheet" href="/assets/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="/assets/plugins/daterangepicker/daterangepicker.css"> --}}

    <style>
        table.static {
            position: relative;
            border: 1px solid #523535;
  border-collapse: collapse;
        }
        body {
            overflow-x: hidden;
        }
    </style>
</head>

<body>
    <img src="{{ URL::asset('/img/kopnew.png') }}" width="100%" height="auto" align="center">

    <h2 align="center"><strong>LAPORAN ABSEN STIPER SANTO THOMAS AQUINAS JAYAPURA</strong></h2>
    <div class="form-group">
        <table class="static" align="center" rules="all" border="1px solid black" style="width: 100%;">
            <thead align="center">
              <tr>
                <th><b>No.</b></th>
                {{-- <th><b>Title Absen</b></th> --}}
                <th><b>Nama</b></th>
                <th><b>Tanggal Absen</b></th>
                <th><b>Jam Masuk</b></th>
                <th><b>Jam Pulang</b></th>
                <th><b>Lokasi Masuk</b></th>
                <th><b>Lokasi Pulang</b></th>
                <th><b>Total Potongan (M&P)</b></th>



              </tr>
            </thead>
            <tbody align="center">
              @php
              $no=0;
              @endphp
              @foreach($lapabsen as $absen)
              @php
              $no++;
              @endphp


                {{-- potongan logic --}}

                {{-- MASUK --}}
                @if ($absen->presence_enter_time <= ('09:00:59'))
                @php
              $TL=0;
              @endphp
                @elseif ($absen->presence_enter_time >= ('09:01:00') AND $absen->presence_enter_time <= ('09:30:59'))
                @php
              $TL=0.5;
              @endphp
                @elseif ($absen->presence_enter_time >= ('09:31:00') AND $absen->presence_enter_time <= ('10:00:59'))
                @php
              $TL=1;
              @endphp
                @elseif ($absen->presence_enter_time >= ('10:01:00') AND $absen->presence_enter_time <= ('10:30:59'))
                @php
              $TL=1.5;
              @endphp
                @elseif ($absen->presence_enter_time >= ('10:31:00'))
                @php
              $TL=2;
              @endphp
                @else
                @php
              $TL=2;
              @endphp
                @endif

                {{-- PULANG --}}
                @if ($absen->presence_out_time >= ('15:00:00'))
                @php
              $CP=0;
              @endphp
                @elseif ($absen->presence_out_time >= ('13:30:00') AND $absen->presence_out_time <= ('13:59:59'))
                @php
              $CP=1.5;
              @endphp
                @elseif ($absen->presence_out_time >= ('14:00:00') AND $absen->presence_out_time <= ('14:29:59'))
                @php
              $CP=1;
              @endphp
                @elseif ($absen->presence_out_time >= ('14:30:00') AND $absen->presence_out_time <= ('14:59:59'))
                @php
              $CP=0.5;
              @endphp
              {{-- @elseif (is_null($absen->presence_out_time))
              @php
              $CP=2;
              @endphp --}}
                @else
                @php
              $CP=2;
              @endphp
                @endif

              <tr>
                <td width="5%">{{$no}}.</td>
                {{-- <td>{{$absen->title}}</td> --}}
                <td>{{$absen->name}}</td>
                {{-- <td>{{$absen->presence_date->isoFormat('dddd, D MMMM Y') }}</td> --}}
                <td>{{Carbon\Carbon::parse($absen->presence_date)->isoFormat('dddd, D MMMM Y') }}</td>
                <td>{{$absen->presence_enter_time}}</td>
                <td>{{$absen->presence_out_time}}</td>
                <td>{{$absen->lokasi_masuk}}</td>
                <td>{{$absen->lokasi_pulang}}</td>
                <td>
                    {{ ($TL + $CP) }}
                </td>


              </tr>
              @endforeach
            </tbody>
            {{-- <tfoot>
              <tr>
                <td colspan=10>
                  {{$users->appends(Request::all())->links()}}
                </td>
              </tr>
            </tfoot> --}}
          </table>
      </div>
<script type="text/javascript">
    window.print();
</script>
</body>

</html>
