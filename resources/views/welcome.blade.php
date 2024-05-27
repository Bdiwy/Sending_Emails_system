<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Send Email Automatic</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" 
  integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Teko:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <link rel="stylesheet" href="{{asset('assets/css/index.css')}}">
</head>
<body class="">
  <div class="loader"></div>
  <div class="container">
  <div class="row">
    <div class="col-lg-6 offset-lg-3">
      <div class="d-flex content-section align-items-center">
        <div class="card-my-owen">  
          <h5 class="text-center title">Send emails <b>Automatically</b> </h5>
          <div class="card ">
            <div div class="card-body">
              <div class="row">
                <form action="" id="form-data" enctype="multipart/form-data" class="col-lg-10 offset-lg-1" method="POST">
                  @csrf
                  <div class="form-group">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputEmail1" clas>Email address</label>
                    <input type="file" name="file" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                    <small id="emailHelp" class="form-text text-muted">Select <b>Excel files only</b></small>
                  </div>
                    <div class="d-flex">
                      <button class="flex-fill  btn btn-primary" id="add-files" title="Add email to current emails in Database">
                        Add files
                      </button>

                      <button type="button" id="all-emails-show-me" data-toggle="modal" data-target="#exampleModal" class="flex-fill  btn btn-info mr-2 ml-2">
                        Show all emails 
                      </button>
                      
                      <button type="submit" id="add-files-scrach"  class="flex-fill  btn btn-warning" title="Delete old emails and add new emails to Database ">
                        Add from scratch
                      </button>
                    
                    </div>
                    <div class="d-flex mt-2">
                      
                      <button class="flex-grow-1 btn btn-success mr-2" data-token="{{csrf_token()}}" id="send-email-request">Send for all emails</button>
                      <button data-token="{{csrf_token()}}" class="btn btn-danger" id="deleteData" title="Delete all emails in Database">Delete all</button>
                    </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="modal fade" id="exampleModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">All emails</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body" id="all_emails">
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js" integrity="sha512-+NqPlbbtM1QqiK8ZAo4Yrj2c4lNQoGv8P79DPtKzj++l5jnN39rHA/xsqn8zE9l0uSoxaCdrOgFs6yjyfbBxSg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js" integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2" crossorigin="anonymous"></script>

  <script src="{{asset('assets/js/sweetalert.js')}}"></script>
  <script src="{{asset('assets/js/index.js')}}"></script>
</body>
</html>