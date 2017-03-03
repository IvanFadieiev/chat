// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require bootstrap
//= require_tree .

$(document).on('click', '.delete_msg', function(e){
    e.preventDefault();
    e.stopPropagation();
    var url = $(this).attr('href') + '/';
    var line = $(this).closest('tr');
    $.ajax({
        url: url,
        method: 'DELETE',
        success: function(result){
            $(line).fadeOut();
        }
    });
    e.preventDefault();
    e.stopPropagation();
});

$(document).ready(function(){
    $('#send_button').on('click', function(event){
        event.preventDefault();
        var data = $('#new_message').serialize();
        $.ajax({
            url: '/messages',
            method: 'POST',
            data: data,
            success: function(data){
                var msg_id = data.message.id;
                $.ajax({
                    url: '/get_message',
                    method: 'GET',
                    data: {message_id: msg_id},
                    success: function(data){
                        $('table').append(data);
                        $('#message_body').val('');
                    }
                })
            }
        })
    })
});