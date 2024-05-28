<?php
namespace App\Jobs;

use App\email;
use App\Mail\Gmail;
use Illuminate\Bus\Queueable;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Mail;
use Illuminate\Queue\SerializesModels;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Exception;

class SendEmailsJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    protected $email;
    protected $code;

    /**
     * Create a new job instance.
     *
     * @param \App\email $email
     * @param string $code
     * @return void
     */
    public function __construct(email $email, $code)
    {
        $this->email = $email;
        $this->code = $code;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        try {
            Mail::to($this->email->email)->send(new Gmail($this->code));
            $this->email->update(['send' => 1]);
        } catch (Exception $e) {
            Log::error('Failed to send email to ' . $this->email->email . ': ' . $e->getMessage());
            throw $e;
        }
    }
}
