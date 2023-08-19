<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Pricing extends Model
{
    public $fillable = ['title', 'subtitle', 'currency', 'format', 'price', 'features'];

    protected $casts = [
        'features' => 'array',
    ];

}
