<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        $procedure = "CREATE PROCEDURE `update_user` 
        (IN _Id BIGINT, IN _Name VARCHAR(255), IN _Lastname VARCHAR(255), IN _Identification VARCHAR(255), IN _Email VARCHAR(255))
        BEGIN
            UPDATE  users  SET name = _Name, lastname = _Lastname, identification = _Identification, email = _Email
            WHERE id = _Id;
        END";

        DB::unprepared($procedure);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        //
    }
};
