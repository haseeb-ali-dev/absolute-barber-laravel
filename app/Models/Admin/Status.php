<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class Status extends Model
{
    use SoftDeletes;
    protected $table = 'status';

    protected $fillable = [
        'title',
        'active',
    ];


    public function setTitleAttribute($value)
    {
        $this->attributes['title'] = Str::lower($value);
    }


    public function scopeActive($query)
    {
        return $query->where('active', 1)->orderBy('updated_at', 'DESC');
    }
}
