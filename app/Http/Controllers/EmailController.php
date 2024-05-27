<?php

namespace App\Http\Controllers;

use App\email;
use App\Mail\Gmail;
use App\Imports\EmailImport;
use App\Template;
use App\Jobs\SendEmailsJob;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Maatwebsite\Excel\Facades\Excel;


class EmailController extends Controller
{

    public function sendEmailAutomatic(Request $request)
    {
        $tem_ID = $request->tempi;
        $template = Template::select('code')->where('id',$tem_ID)->get();
        $code = $template[0]->code;
        
        $emails = email::where('send','0')->get();
        
        if ($emails->count() >=1 ) {    
            foreach ($emails as $value) {
                try {
                    dispatch(new SendEmailsJob($code));
                    sleep(1);
                } catch (ModelNotFoundException $exception) {
                    return back()->withError($exception->getMessage())->withInput();
                
                    exit;
                }
                
            }

            return response()->json([
                "status"    => '1',
                "msg"       => 'Send all emails successfully'
            ]);
        } else {
          return response()->json([
                "status"    => '0',
                "msg"       => 'No emails found please add some files'
            ]);  
        }
        
       
    }

    public function getEmailsNumber()
    {

        return email::all()->count();
    }


    public function showData()
    {
        $sql_get = email::all();
        $counter=1;
        
        
        $data = '<div class="row">';
        foreach ($sql_get as  $value) {
            if ($counter < 10) {
                $counter = '0'.$counter;
            }
            $data .= "<div class='col-12' id='$value->id'> ";
            $data .= "<div class='row'>";
            $data .= '<div class="col-8 border-bottom mb-3 pb-2">'.$counter++."- ".$value->email.'</div>';
            $spa = '<span class="badge badge-success">send</span>';
            $sss = '<span class="badge badge-danger">not send</span>';
            $data .= '<div class="col-2 border-bottom mb-3 pb-2">';
            $data .= ($value->send == "1")?"$spa":"$sss";
            $data.= '</div>';
            
            $data .= ' <div class="col-2 text-right mb-3 pb-2 border-bottom text-danger" ><i class="far fa-trash-alt delete-btn" data-token="'.csrf_token().'" data-id="'.$value->id.'"></i></div>';
            $data .= '</div>';
            $data .= '</div>';
        }
        $data.="</div>
        <script>
            $('.delete-btn').on('click',function (e) {
                e.preventDefault();
                var token = $(this).data('token');
                var id = $(this).data('id');
                Swal.fire({
                    icon: 'question',
                    title: 'Do you want to Delete this email?',
                    showCancelButton: true,
                    confirmButtonText: 'Yes',
                    
                    }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                        url: 'https://eaalim.com/emails/deleteone',
                        method: 'post',
                        data: {
                        '_token': token,
                        'id' : id
                        },
                        beforeSend: function () {
                            $('.loader').css({
                            'opacity':'.9',
                            'display':'block'
                            });
                        },
                        success: function (data) {
                            if (data.status == '1') {
                            Swal.fire({
                                title: 'Successfully',
                                text: data.msg,
                                icon: 'success',
                                padding: '2em'
                            })
                            $('#'+id).remove();
                            } else {
                            Swal.fire({
                                title: 'Error',
                                text: data.msg,
                                icon: 'error',
                                padding: '2em'
                            })

                            }
                        $('.loader').css({
                            'opacity':'.9',
                            'display':'none'
                            });
                        },

                        })
                    } 
                    })
                
            })</script>
        ";
        return $data;
    }
    

    public function addFilesToCurrent(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls'
        ]);
        

        $up = Excel::import(new EmailImport,request()->file('file'));
        if ($up) {
            return response()->json([
                "status"    => '1',
                "msg"       => 'Upload successfully'
            ]);
        } else {
            return response()->json([
                "status"    => '0',
                "msg"       => 'Sorry, please try again'
            ]);
        }
    }

    public function uploadScrach(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,xls'
        ]);
     
        $sliderDelete = email::truncate();
        if ($sliderDelete) {
            $up = Excel::import(new EmailImport,request()->file('file'));
            if ($up) {
                return response()->json([
                    "status"    => '1',
                    "msg"       => 'Upload successfully'
                ]);
            } else {
                return response()->json([
                    "status"    => '0',
                    "msg"       => 'Sorry, please try again'
                ]);
            }
        } else {
            return response()->json([
                    "status"    => '0',
                    "msg"       => 'Sorry, please try again'
                ]);
        }
    }

    public function deleteEmail(Request $request)
    {
         
        $sliderDelete = email::truncate();
        
        if ($sliderDelete)
            return response()->json([
                "status"    => '1',
                "msg"       => 'Deleted successfully'
            ]);
        else
            return response()->json([
                "status"    => '0',
                "msg"       => 'Sorry, please try again'
            ]);
    }

    public function deleteOne(Request $request)
    {
         
        $sliderDelete = email::destroy($request->id);
        
        if ($sliderDelete)
            return response()->json([
                "status"    => '1',
                "msg"       => 'Deleted successfully'
            ]);
        else
            return response()->json([
                "status"    => '0',
                "msg"       => 'Sorry, please try again'
            ]);
    }

    public function store_temp(Request $request)
    {
        $request->validate([
            'template_name'        =>'required', 
            'template'  =>'required',    
        ]);
            
      
    
        $slider = Template::create([
            "name"            =>$request->template_name,
            "code"      =>$request->template,
        
        ]);

        if ($slider)
            return response()->json([
                "status"    => '1',
                "msg"       => 'Added successfully'
            ]);
        else
            return response()->json([
                "status"    => '0',
                "msg"       => 'Sorry, please try again'
            ]);
    }

    public function showTemplate()
    {
        $sql_get = Template::all();
        $counter=1;
        
        
        $data = '<div class="row">';
        foreach ($sql_get as  $value) {
            if ($counter < 10) {
                $counter = '0'.$counter;
            }
            $data .= "<div class='col-12' id='$value->id'> ";
            $data .= "<div class='row'>";
            $data .= '<div class="col-9 border-bottom mb-3 pb-2">'.$counter++."- ".$value->name.'</div>';
            $data .= ' <div class="col-3 text-right mb-3 pb-2 border-bottom " >
            
            <a target="_blank" href="https://eaalim.com/emails/template/'.$value->id.'" class="btn btn-inline-block btn-success"><i class="far fa-eye"></i></a> 
            <a href="#" class="btn btn-inline-block btn-danger temp-delete-btn" data-token="'.csrf_token().'" data-id="'.$value->id.'"><i class="far fa-trash-alt" ></i></a>
            </div>';
            $data .= '</div>';
            $data .= '</div>';
        }
        $data.="</div>
        <script>
            $('.temp-delete-btn').on('click',function (e) {
                e.preventDefault();
                var token = $(this).data('token');
                var id = $(this).data('id');
                Swal.fire({
                    icon: 'question',
                    title: 'Do you want to Delete this template?',
                    showCancelButton: true,
                    confirmButtonText: 'Yes',
                    
                    }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                        url: 'https://eaalim.com/emails/deletetempone',
                        method: 'post',
                        data: {
                        '_token': token,
                        'id' : id
                        },
                        beforeSend: function () {
                            $('.loader').css({
                            'opacity':'.9',
                            'display':'block'
                            });
                        },
                        success: function (data) {
                            if (data.status == '1') {
                            Swal.fire({
                                title: 'Successfully',
                                text: data.msg,
                                icon: 'success',
                                padding: '2em'
                            })
                            $('#'+id).remove();
                            } else {
                            Swal.fire({
                                title: 'Error',
                                text: data.msg,
                                icon: 'error',
                                padding: '2em'
                            })

                            }
                        $('.loader').css({
                            'opacity':'.9',
                            'display':'none'
                            });
                        },

                        })
                    } 
                    })
                
            })</script>
        ";
        return $data;
    }

    // show template
    public function oneTemplate($id)
    {
        $dt = Template::where('id',$id)->get();
        return view('template',[
            'dt' => $dt
        ]);
    }

    // delete template
    public function deletetempone(Request $request)
    {
        $sliderDelete = Template::destroy($request->id);
        
        if ($sliderDelete)
            return response()->json([
                "status"    => '1',
                "msg"       => 'Deleted successfully'
            ]);
        else
            return response()->json([
                "status"    => '0',
                "msg"       => 'Sorry, please try again'
            ]);
    }
}
