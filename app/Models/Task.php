<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;

    protected $table = "tasks";
    protected $fillable = ['title', 'description'];

    public $timestamps = false;

    // Relation belongsToMany with tasklist
    public function tasklist()
    {
        return $this->belongsToMany(TaskList::class);
    }

}
