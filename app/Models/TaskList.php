<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TaskList extends Model
{
    use HasFactory;

    protected $table = "list";
    protected $fillable = ['list_code', 'title', 'description', 'user_id'];

    public $timestamps = false;

    // Relation hasMany with Task
    public function tasks()
    {
        return $this->belongstomany(Task::class);
    }

    // Relation hasMany with User
    public function users()
    {
        return $this->belongsTo(User::class, 'user_id', 'id');
    }
}
