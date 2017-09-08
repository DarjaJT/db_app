$(document).on('turbolinks:load', function () {
// New User
    // If the checkbox > 0 is selected, the button is visible otherwise invisible
    $('input[type=checkbox]').bind('click' , function() {
        if ($('.span6').find('input.checkboxes:checked').length > 0) {
            document.getElementById('btn_create_account').style.display = 'block';
        } else {
            document.getElementById('btn_create_account').style.display = 'none';
        }
    });

    // if the checkbox trainer is selected
    $('#trainer').on("click", function () {
        if($(this).is(':checked')){
            $.ajax({
                type: "get",
                url: "/trainer_form"
            });
        }else $('#checked_trainer').html('');
    });

    // if the checkbox sportsman is selected
    $('#sportsman').on("click", function () {
        if($(this).is(':checked')){
            $.ajax({
                type: "get",
                url: "/sportsman_form"
            });
        }else $('#checked_sportsman').html('');
    });

    // On the selected item, the data in the select change data in another selection (groups in the hall )
    $(document).on("change", 'select#halls', function () {
        var hall_id = $(this).val();
        if($(this).val()!=''){
            $.ajax({
                type: "get",
                url: "/hall_groups_options/" + hall_id
            });
        }else $('select#group_id').html('');
    });

    // On the selected item, the data in the select change data in another selection ( trainer in the group )
    $(document).on("change", 'select#group_id', function () {
        var group_id = $(this).val();
        if($(this).val()!=''){
            $.ajax({
                type: "get",
                url: "/group_trainers_options/" + group_id
            });
        }else $('select#trainer_id').html('');
    });

});
