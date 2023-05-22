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
        Schema::create('task_task_list', function (Blueprint $table) {
            $table->id();
             // Relationship with users and tasks
             $table->bigInteger('task_list_id')->unsigned();
             $table->foreign('task_list_id')->references('id')->on('list')->onDelete('cascade');
 
             $table->bigInteger('task_id')->unsigned();
             $table->foreign('task_id')->references('id')->on('tasks')->onDelete('cascade');
            //$table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('task_task_list');
    }
};
