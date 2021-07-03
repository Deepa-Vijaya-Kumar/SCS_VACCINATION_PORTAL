$(function() {

  // test to ensure jQuery is working
  console.log("whee!")

  // disable refresh button
  $("#refresh1-btn").prop("disabled", true)

  // disable refresh button
  $("#submit-btn").prop("disabled", true)
  

  $("#state_select").change(function() {

    // grab value
    var state_id = $("#state_select").val();

    // send value via GET to URL /<department_id>
    var get_request = $.ajax({
      type: 'GET',
      url: '/state/' + state_id + '/',
    });

    // handle response
    get_request.done(function(data){

      // data
      console.log(data)

      // add values to list 
      var option_list = [["", "Select a district--messe"]].concat(data);
      $("#district_select").empty();
        for (var i = 0; i < option_list.length; i++) {
          $("#district_select").append(
            $("<option></option>").attr("value", option_list[i][0]).text(option_list[i][1]));
        }
      // show model list
      $("#district_select").show();
    });
  });
  $("#district_select").change(function() {

    // grab value
    var district_id = $("#district_select").val();

    // send value via GET to URL /<department_id>
    var get_request = $.ajax({
      type: 'GET',
      url: '/district/' + district_id + '/',
    });

    // handle response
    get_request.done(function(data){

      // data
      console.log(data)

      // add values to list 
      var option_list = [["", "Select a vaccine-variant"]].concat(data);
      $("#vaccine_select").empty();
        for (var i = 0; i < option_list.length; i++) {
          $("#vaccine_select").append(
            $("<option></option>").attr("value", option_list[i][0]).text(option_list[i][1]));
        }
      // show model list
      $("#vaccine_select").show();
    });
  });


  $("#vaccine_select").change(function() {
    $("#dose_select").show();


  });

  $("#dose_select").change(function() {
//    $("#submit-btn").removeClass("btn-default")
//    $("#submit-btn").addClass("btn-success")
    $("#submit-btn").prop("disabled", false)

  });
  $("#submit-btn").click(function() {

    // grab values
    var state = $("#state_select").find(":selected").text();
    var district = $("#district_select").find(":selected").text();
    var vaccine = $("#vaccine_select").find(":selected").text();

    var vaccine_slot = $.ajax({
      type: 'GET',
      url: '/vaccineslot/' + vaccine + '/' +district +'/'
    });

    // handle response
    vaccine_slot.done(function(data){

      // data
      console.log(data)
      $("#chosen_slot").html(data[0][0]);
      $("#chosen_slot1").html(data[0][1]);

      if( data[0][0]<=0){
        $("#book-btn").prop("disabled", true);
        
      }
      if(data[0][1]<=0 ){
        $("#book1-btn").prop("disabled", true);
        
      }

    
    });

    // append values to the DOM
    $("#chosen_state").html(state);
    $("#chosen_district").html(district);
    $("#chosen_vaccine").html(vaccine);
    $("#chosen_state1").html(state);
    $("#chosen_district1").html(district);
    $("#chosen_vaccine1").html(vaccine);
   

    // show values selected
    $("#show_selection").show();
    // enable refresh button
    $("#refresh1-btn").prop("disabled", false)
    // disable submit button
    $("#submit-btn").prop("disabled", true);

    // disable dropdown inputs
    $("#state_select").prop("disabled", true);
    $("#district_select").prop("disabled", true);
    $("#vaccine_select").prop("disabled", true);
  });

  $("#refresh-btn").click(function() {

    // remove values to the DOM
    $("#chosen_state").html("");
    $("#chosen_district").html("");
    $("#chosen_vaccine").html("");
    $("#chosen_state1").html("");
    $("#chosen_district1").html("");
    $("#chosen_vaccine1").html("");
    $("#chosen_slot").html("");
    $("#chosen_slot1").html("");

    // hide values selected
    $("#show_selection").hide();
    // disable refresh button
    $("#refresh-btn").prop("disabled", true);
    // enable submit button
    $("#submit-btn").prop("disabled", true);
    // hide model list
    $("#district_select").hide();
    $("#vaccine_select").hide();


    // enable dropdown inputs
    $("#state_select").prop("disabled", false);
    $("#district_select").prop("disabled", false);
    $("#vaccine_select").prop("disabled", false);
    
  });
  $("#book-btn").click(function() {
    //grab values
    var state = $("#state_select").find(":selected").text();
    var district = $("#district_select").find(":selected").text();
    var vaccine = $("#vaccine_select").find(":selected").text();
    var dose = $("#dose_select").find(":selected").text();
    var time = $("#time").find(":selected").text();
    console.log(dose)
    console.log(time)


    window.location.href = '/book/'+state+'/'+district+'/'+vaccine+'/'+dose+'/'+time+'/today/'
  });
  $("#book1-btn").click(function() {
    //grab values
    var state = $("#state_select").find(":selected").text();
    var district = $("#district_select").find(":selected").text();
    var vaccine = $("#vaccine_select").find(":selected").text();
    var dose = $("#dose_select").find(":selected").text();
    var time = $("#time1").find(":selected").text();
    console.log(dose)
    console.log(time)

    window.location.href = '/book/'+state+'/'+district+'/'+vaccine+'/'+dose+'/'+time+'/tomorrow/'
  });
});