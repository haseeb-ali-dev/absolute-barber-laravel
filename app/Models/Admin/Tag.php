<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Tag extends Model
{

    public function recipients()
    {
        return $this->belongsToMany(Recipient::class, 'recipients_tags', 'tag_id', 'recipient_id');
    }
}
