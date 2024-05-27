$(function () {
  'use strict';

  // Ajax calling
  // delete all database
  $('#deleteData').on('click',function (e) {
    e.preventDefault();
    var token = $(this).data("token");
    
    Swal.fire({
      icon: 'question',
      title: 'Do you want to Delete all data?',
      showCancelButton: true,
      confirmButtonText: 'Yes',
      
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: link+'/delete',
          method: 'post',
          data: {
          "_token": token,
          },
          beforeSend: function () {
            $('.loader').css({
              'opacity':'.9',
              'display':'block'
            });
          },
          success: function (data) {
            if (data.status == "1") {
              Swal.fire({
                title: 'Successfully',
                text: data.msg,
                icon: 'success',
                padding: '2em'
              })
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
    
  })

  // add file to current
  $('#add-files').on('click',function (e) {
    e.preventDefault();
     var formData = new FormData($('#form-data')[0]);
     Swal.fire({
      icon: 'question',
      title: 'Do you want to Add new files to current?',
      showCancelButton: true,
      confirmButtonText: 'Yes',
      
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: link+'/addfile',
          method:'post',
          enctype: 'multipart/form-data',
          data: formData,
          processData:false,
          contentType:false,
          cache:false,
          beforeSend: function () {
            $('.loader').css({
              'opacity':'.9',
              'display':'block'
            });
          }, // before
          success: function (data) {
            if (data.status == "1") {
              Swal.fire({
                title: 'Successfully',
                text: data.msg,
                icon: 'success',
                padding: '2em'
              })
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
          }, // success
          error:function (data) {
            var response = JSON.parse(data.responseText);
            
           Swal.fire({
                title: 'Error',
                text: response,
                icon: 'error',
                padding: '2em'
              })
            $('.loader').css({
                  'opacity':'.9',
                  'display':'none'
                });

          }
        }); // ajax
      }
    })
  });

  // add file from scrach
  $('#add-files-scrach').on('click',function (e) {
    e.preventDefault();
     var formData = new FormData($('#form-data')[0]);
     Swal.fire({
      icon: 'question',
      title: 'Do you want to Delete data and add emails from scratch?',
      showCancelButton: true,
      confirmButtonText: 'Yes',
      
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: link+'/store',
          method:'post',
          enctype: 'multipart/form-data',
          data: formData,
          processData:false,
          contentType:false,
          cache:false,
          beforeSend: function () {
            $('.loader').css({
              'opacity':'.9',
              'display':'block'
            });
          }, // before
          success: function (data) {
            if (data.status == "1") {
              Swal.fire({
                title: 'Successfully',
                text: data.msg,
                icon: 'success',
                padding: '2em'
              })
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
          }, // success
          error:function (data) {
            var response = JSON.parse(data.responseText);
            
           Swal.fire({
                title: 'Error',
                text: response.errors.file,
                icon: 'error',
                padding: '2em'
              })
            $('.loader').css({
                  'opacity':'.9',
                  'display':'none'
                });

          }
        }); // ajax
      }
    })
  });

  // show all data
  $('#all-emails-show-me').on('click',function () {
    $.ajax({
          url: link+'/showData',
          method: 'get',
          
          beforeSend: function () {
            $('#all_emails').append('<div class="loader"></div>');
          },
          success: function (data) {
            $('#all_emails').html('').append(data);
          },

        })
  })
 
  $('#send-emial-auo').on('submit',function (e) {
    e.preventDefault();
    var formData = new FormData($(this)[0]);
    Swal.fire({
      icon: 'question',
      title: 'Do you want to send emails?',
      showCancelButton: true,
      confirmButtonText: 'Yes',
      
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: link+'/send',
          method: 'post',
          enctype: 'multipart/form-data',
          data: formData,
          processData: false,
          contentType: false,
          cache: false,
          beforeSend: function () {
            
            $('.loader').css({
              'opacity':'.9',
              'display':'block'
            });
          },
          success: function (data) {
            if (data.status == "1") {
              Swal.fire({
                title: 'Successfully',
                text: data.msg,
                icon: 'success',
                padding: '2em'
              })
            } else if (data.status == "0") {
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
  })


  // submit template form
  $('#form-data-template').on('submit', function (e) {
    e.preventDefault();
    var formData = new FormData($(this)[0]);
    Swal.fire({
      icon: 'question',
      title: 'Do you want to add new template',
      showCancelButton: true,
      confirmButtonText: 'Yes',

    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
          url: link+'/templatestore',
          method: 'post',
          enctype: 'multipart/form-data',
          data: formData,
          processData: false,
          contentType: false,
          cache: false,
          beforeSend: function () {
            $('.loader').css({
              'opacity': '.9',
              'display': 'block'
            });
          }, // before
          success: function (data) {
            if (data.status == "1") {
              Swal.fire({
                title: 'Successfully',
                text: data.msg,
                icon: 'success',
                padding: '2em'
              })
              $('.in').val('');
            } else {
              Swal.fire({
                title: 'Error',
                text: data.msg,
                icon: 'error',
                padding: '2em'
              })

            }
            $('.loader').css({
              'opacity': '.9',
              'display': 'none'
            });
          }, // success
          error: function (data) {
            var response = JSON.parse(data.responseText);

            Swal.fire({
              title: 'Error',
              text: response.errors.file,
              icon: 'error',
              padding: '2em'
            })
            $('.loader').css({
              'opacity': '.9',
              'display': 'none'
            });

          }
        }); // ajax
      }
    })
  });

  // show all templates
  $('#show-template').on('click', function () {
    $.ajax({
      url: link+'/showTemplate',
      method: 'get',

      beforeSend: function () {
        $('#all_template').append('<div class="loader"></div>');
      },
      success: function (data) {
        $('#all_template').html('').append(data);
      },

    })
  })
});