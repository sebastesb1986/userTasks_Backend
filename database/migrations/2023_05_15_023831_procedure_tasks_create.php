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
        
        $procedure = "CREATE PROCEDURE `create_tasks` 
        (IN _Title VARCHAR(255), IN _Description VARCHAR(255))
        BEGIN
            INSERT INTO tasks (title, description) VALUES(_Title, _Description);
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
