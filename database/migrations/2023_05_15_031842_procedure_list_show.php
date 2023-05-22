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
        $procedure = "CREATE PROCEDURE `show_list`
        (IN _Id BIGINT, IN _Code VARCHAR(255))
        BEGIN
            SELECT lst.id, lst.list_code, lst.title, lst.description 
            FROM list lst
            WHERE lst.list_code = _Code
            AND lst.user_id = _Id;
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
