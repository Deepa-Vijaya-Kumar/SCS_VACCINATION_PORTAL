$(function() {

    // test to ensure jQuery is working
    console.log("whee!")

    $("#register-btn").prop("disabled", true)

    $("#show_selection").hide();
    
    $("#register-btn").click(function() {
        // var flaskData= JSON.parse('{ data }');
        
        $("#show_selection").show();
        var username = $("#user_name").val();
        $("#chosen_user_name").html(username);
        var proof_id = $("#proof_id").val();
        $("#chosen_proof_id").html(proof_id);


        
    });


    $("#proof_id").change(function() {
        $("#register-btn").prop("disabled", false)
    });
    
  });