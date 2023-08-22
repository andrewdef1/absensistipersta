<?php

namespace Database\Seeders;

use App\Models\User;
use App\Models\Role;
use App\Models\Position;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'name' => 'Drew (Admin)',
            'email' => 'andrewdefretes@gmail.com',
            'password' => '$2y$10$YOnD7.7GNqWoRiGswl2co.ThOekuaj5UaYwRalXZwMM.8jTZ.dTy2',
            'role_id' => Role::where('name', 'admin')->first('id'),
            'position_id' => Position::where('name', 'Operator')->first('id'),
        ]);
    }
}