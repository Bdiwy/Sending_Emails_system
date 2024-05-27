<?php

namespace App\Jobs;

use App\Models\Email;
use App\Mail\Gmail;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Illuminate\Support\Facades\Mail;

class SendEmailsJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle($code)
    {
        $emails = Email::all();
        foreach ($emails as $email) {
            Mail::to($email->email)->send(new Gmail($code));
            email::where('id',$value->id)
            ->update([
                'send'=>'1'
            ]);
    
        }
    }
}
