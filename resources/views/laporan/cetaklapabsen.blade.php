@extends('layouts.base')
<link rel="shortcut icon" href="{{ URL::asset('/img/logostiper.ico') }}" />
<link rel="icon" href="{{ URL::asset('/img/logostiper.ico') }}" type="image/x-icon"/>
    @if(session('status'))
    <div class="alert alert-success alert-dismissible">
      <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
      {{session('status')}}
    </div>
    @endif
    {{-- <div class="row" style="margin: auto;">
        </div> --}}
    <div class="row pt-3 pl-3 pr-3">
      <div class="card" style="width: 100%">
        <div class="card-header">
          <h4 class="inline-block pt-2">CETAK LAPORAN ABSEN</h4>

        </div>
        <div class="card-body">

                <label for="tglawal">Tanggal Awal</label>
                <input required  class="form-control" placeholder="Tanggal Awal" type="date" name="tglawal" id="tglawal" />
            <br>

            <label for="tglakhir">Tanggal Akhir</label>
            <input required  class="form-control" placeholder="Tanggal Akhir" type="date" name="tglakhir" id="tglakhir" />

          <br>
            <div class="input-group mb-3">
                <a href="#" onclick="this.href='/laporanabsen/laporan/cetak/'+document.getElementById('tglawal').value +
                '/' + document.getElementById('tglakhir').value" target="_blank" class="btn btn-primary col-md-12">Cetak Laporan Pertanggal <i class="fa fa-print" aria-hidden="true"></i></a>
            </div>
        </div>
      </div>
    </div>

