<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Campaign extends Model
{
    public function recipients()
    {
        return $this->belongsToMany(Recipient::class, 'campaigns_recipients', 'campaign_id', 'recipient_id');
    }
}
