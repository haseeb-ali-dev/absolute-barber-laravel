<?php

namespace App\Models\Admin;

use Illuminate\Database\Eloquent\Model;

class Recipient extends Model
{

    public function campaigns()
    {
        return $this->belongsToMany(Campaign::class, 'campaigns_recipients', 'recipient_id', 'campaign_id');
    }

    public function tags()
    {
        return $this->belongsToMany(Tag::class, 'recipients_tags', 'recipient_id', 'tag_id');
    }

}
