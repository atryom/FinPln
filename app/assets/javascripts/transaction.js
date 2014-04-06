/**
 * Created by atryom on 05.04.14.
 */
$(document).on('page:change', function(){
    var now = new Date()
    var to_Day = new Date(now.getFullYear(), now.getMonth(), now.getDate())
    $("#transaction_date").change(function(){
        var date_str = $(this).val();
        if (date_str.length == 10){
            var date_val = new Date(date_str.substr(6),(date_str.substr(3,2)*1-1),date_str.substr(0,2));
            if (date_val < to_Day)
            {
                $("#transaction_completed").prop('checked', true);
            }
            else if (date_val > to_Day)
            {
                $("#transaction_completed").prop('checked', false);
            }
        }

    });
});
