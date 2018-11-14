// $(".menu-items a").on("click", function() {
//   $(".menu-items").find("li > .icon-thumbnail").removeClass("bg-success");
//   $(this).parent().addClass("bg-success");
// });

// $(".menu-items>li").each(function() {
//     var navItem = $(this);
//     if (navItem.find("a").attr("href") == location.pathname.replace(/^.*[\\\/]/, '')) {
//       navItem.find(".icon-thumbnail").addClass("bg-success");
//     } else if (location.pathname.replace(/^.*[\\\/]/, '') == "buy_flight.php") {
//       if (navItem.find("a").attr("href") == "flights.php") {
//         navItem.find(".icon-thumbnail").addClass("bg-success");
//       }
//     } else if (location.pathname.replace(/^.*[\\\/]/, '') == "register_flight.php") {
//       if (navItem.find("a").attr("href") == "flights.php") {
//         navItem.find(".icon-thumbnail").addClass("bg-success");
//       }
//     } else if (location.pathname.replace(/^.*[\\\/]/, '') == "register_shipment.php") {
//       if (navItem.find("a").attr("href") == "shipments.php") {
//         navItem.find(".icon-thumbnail").addClass("bg-success");
//       }
//     } else if (location.pathname.replace(/^.*[\\\/]/, '') == "register_order.php") {
//       if (navItem.find("a").attr("href") == "orders.php") {
//         navItem.find(".icon-thumbnail").addClass("bg-success");
//       }
//     }
// });


// $('#language').change(function(e) {
//   e.preventDefault();
//   y = $(this).val();

//   $.ajax({
//    url: 'server/change_language.php?lang=' + y,
//    type: 'POST',
//    success: function(data){
//      console.log(data);
//      if (y == 'ch'){
//        window.location.href = "../ch/dashboard/index.php";
//      } else {
//        window.location.reload();
//      }
//    }
//    });
// });

// $('#nameDropdown').click(function(){
//
// })

// $('#buyFlight').click(function(){
//   window.location.href = "buy_flight.php";
// })

// $('#createFlight').click(function(){
//   window.location.href = "register_flight.php";
// })

// $('#createShipment').click(function(){
//   window.location.href = "register_shipment.php";
// })

// $('#createOrder').click(function(){
//   window.location.href = "register_order.php";
// })

// function buyFlight() {
//   $.ajax({
//     url: 'server/buy_flight_form.php',
//      type: "POST",
//     data: $('#flightInfo').serialize() + '&' +
//           $('#userInfo').serialize() +
//           '&finalPrice=' + $('#savingsSummary').html(),
//     success: function(result) {
//       data = JSON.parse(result);
//       if (data.status == 'success') {
//         window.location.href = "flights.php";
//       } else {
//         return false;
//       }
//     }
//   });
// }

// function registerFlight() {
//   $.ajax({
//     url: 'server/register_flight_form.php',
//      type: "POST",
//     data: $('#depInfo').serialize() + '&' +
//           $('#arriInfo').serialize() + '&' +
//           $('#pricingInfo').serialize(),
//     success: function(result) {
//       data = JSON.parse(result);
//       if (data.status == 'success') {
//         window.location.href = "flights.php";
//       } else {
//         return false;
//       }
//     }
//      });
// };

// function itemSummary() {
// 	$items = [];
// 	$('#items > div').each(function(){
// 		$item = {};
// 		$(this).find('input[type!=file]').each(function(){
// 			$item[$(this).attr('name')] = $(this).val();
// 		});
// 		$items.push($item);
// 	});
// 	return $items;
// };

// function registerShipment() {
//   var items = itemSummary();
//   $.ajax({
//     url: 'server/register_shipment_form.php',
//     type: 'POST',
//     data: $('#senderInfo').serialize() + '&' +
//           $('#receiverInfo').serialize() + '&items=' + JSON.stringify($items),
//     success: function(result) {
//       data = JSON.parse(result);
//       if (data.status == 'success') {
//         window.location.href = "shipments.php";
//       } else {
//         document.getElementById("testResult").innerHTML = "2";
//       }
//     }
//   })
// };



// function getAirport(code) {
//     switch (code) {
//       case 'YYZ':
//         airport = "YYZ - Toronto Pearson Airport";
//         break;
//       case 'YTZ':
//         airport = "YTZ - Billy Bishop Airport";
//         break;
//       case 'SHA':
//         airport = "SHA - Shanghai Pudong Airport";
//         break;
//       case 'PEK':
//         airport = "PEK - Beijing Capital Airport";
//         break;
//   }
//   return airport;
// }


function headsUp($title, $msg, $footer='', $id='', $class='', $time=4000) {
  $id = $id || $.now();
  var $modal = $('<div class="modal fade '+($class? $class:'')+'" id="'+$id+'" role="dialog" aria-hidden="false">\
    <div class="modal-dialog">\
      <!-- Modal content-->\
      <div class="modal-content">'+ ($title ?
        '<div class="modal-header"><h3>\
          '+$title+
        '</h3></div>' : '') +
        '<div class="modal-body">\
          '+$msg+
        '</div>\
        <div class="modal-footer">\
          '+($footer? $footer:'<button class="btn btn-success btn-cons btn-animated from-left \
            fa fa-check pull-right" onclick="dismissHeadsUp($(\'#'+$id+'\'))"><span>Ok</span></button>')+
        '</div>\
      </div>\
    </div>\
  </div>');
  $('body').append($modal);
  showHeadsUp($modal);

  if ($time > 0) {
    setTimeout(function(){dismissHeadsUp($modal);}, $time);
  }
}

function showHeadsUp($modal) {
  if (!$('.modal-backdrop').length) {
    $('body').append($('<div class="modal-backdrop fade"></div>'));
  }

  $modal.css('display','block');
  setTimeout(function(){
    $modal.addClass('in');
  }, 20);

  $('.modal-backdrop').css('display','block');
  setTimeout(function(){
    $('.modal-backdrop').addClass('in');
  }, 20);
}

function dismissHeadsUp($modal) {
  // Only dismiss if modal is still attached to body
  if ($modal.parent().length) {
    $modal.removeClass('in');
    $('.modal-backdrop').removeClass('in');

    setTimeout(function(){
      $modal.remove();
      $('.modal-backdrop').css('display','none');
    }, 520);
  }
}



// Generic tab form validation, only checks if required fields are empty,
// Accepts callback for function extension. Returns false at the first error or
// true if no error was found
// function validate($options = array()) {
//   if (!$options.onValidate)  $options.onValidate = function(){return true;};
//   if (!$options.onError)  $options.onError = function(){};
//   if (!$options.error_title)  $options.error_title = 'Warning';
//   if (!$options.error_required)  $options.error_required = 'Please fill in the required fields to proceed.';
//   if ($options.target)  $current_tab = $options.target;
//   else  $current_tab = $('.nav-item a.active').attr('href');

//   var $error = false;
//   $($current_tab).find('form .has-error').removeClass('has-error');
//   $($current_tab).find('form').find('input, textarea, select').each(function(){

//     // required field empty?
//     if (($(this).prop('required') && $(this).val().trim().length === 0)) {
//       headsUp($options.error_title, $options.error_required, '', 'modal-required');
//       $error = true;
//       $(this).closest('.form-group').addClass('has-error')
//       $options.onError($(this));
//       return false; // Stop the loop
//     }

//     // Custom validation method
//     if (!$options.onValidate($(this))) {
//       $error = true;
//       $(this).closest('.form-group').addClass('has-error')
//       $options.onError($(this));
//       return false; // Stop the loop
//     }
//   });

//   return !$error;
// }
