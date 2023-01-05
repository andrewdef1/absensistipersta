@extends('layouts.app')

@section('content')
@include('partials.alerts')

<div class="row">
    <div class="col-md-7">
        <ul class="list-group">
            @foreach ($attendances as $attendance)
            <a href="{{ route('presences.show', $attendance->id) }}"
                class="list-group-item d-flex justify-content-between align-items-start py-3">
                <div class="ms-2 me-auto">
                    <div class="fw-bold">{{ $attendance->title }}</div>
                    <p class="mb-0">{{ $attendance->description }}</p>
                </div>
                @include('partials.attendance-badges')
            </a>
            @endforeach
        </ul>
    </div>
</div>

<div class="container">
    <h1>How to Get Current User Location with Laravel - ItSolutionStuff.com</h1>
    <div class="card">
        <div class="card-body">
            @if($checkLocation)
                <h4>IP: {{ $checkLocation->ip }}</h4>
                <h4>Country Name: {{ $checkLocation->country }}</h4>
                <h4>Country Code: {{ $checkLocation->iso_code }}</h4>
                <h4>Region Code: {{ $checkLocation->state }}</h4>
                <h4>Region Name: {{ $checkLocation->state_name }}</h4>
                <h4>City Name: {{ $checkLocation->city }}</h4>
                <h4>Zip Code: {{ $checkLocation->postal_code }}</h4>
                <h4>Latitude: {{ $checkLocation->lat }}</h4>
                <h4>Longitude: {{ $checkLocation->lon }}</h4>
                <h4>Longitude: {{ $checkLocation->continent }}</h4>
                <h4>Longitude: {{ $checkLocation->timezone }}</h4>
            @endif
        </div>
    </div>
</div>
@endsection
