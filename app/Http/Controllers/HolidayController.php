<?php

namespace App\Http\Controllers;

use App\Models\Holiday;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Imports\HolidayImport;
use Maatwebsite\Excel\Facades\Excel;

class HolidayController extends Controller
{
    public function index()
    {
        return view('holidays.index', [
            "title" => "Hari Libur"
        ]);
    }

    public function create()
    {
        return view('holidays.create', [
            "title" => "Tambah Data Hari Libur"
        ]);
    }

    public function edit()
    {
        $ids = request('ids');
        if (!$ids)
            return redirect()->back();
        $ids = explode('-', $ids);

        $holidays = Holiday::query()
            ->whereIn('id', $ids)
            ->get();

        return view('holidays.edit', [
            "title" => "Edit Data Hari Libur",
            "holidays" => $holidays
        ]);
    }

    public function importHoliday(Request $request)
    {
        $this->validate($request, [
            'file' => 'required|mimes:csv,xls,xlsx'
        ]);

        $file = $request->file('file');

        // membuat nama file unik
        $nama_file = $file->hashName();

        //temporary file
        $path = $file->storeAs('public/excelimport/',$nama_file);

        // import data
        $import = \Excel::import(new HolidayImport(), storage_path('app/public/excelimport/'.$nama_file));

        //remove from server
        \Storage::delete($path);

        if($import) {
            //redirect
            return redirect()->route('holidays.index')->with(['success' => 'Data Berhasil Diimport!']);
        } else {
            //redirect
            return redirect()->route('holidays.index')->with(['error' => 'Data Gagal Diimport!']);
        }
    }
}