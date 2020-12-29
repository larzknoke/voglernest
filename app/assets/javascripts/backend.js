//= require jquery
//= require jquery_ujs
//= require momentjs
//= require semantic-ui
//= require semantic-ui-calendar
//= require cocoon
//= requireOFF daterangepicker
//= require selectize

console.log("backend!!!");

$(document).ready(function () {
  $(".ui.dropdown").dropdown();
  $(".popup").popup();

  // UI calendar
  var text = {
    days: ["S", "M", "D", "M", "D", "F", "S"],
    months: [
      "Januar",
      "Februar",
      "März",
      "April",
      "Mai",
      "Juni",
      "Juli",
      "August",
      "September",
      "Oktober",
      "November",
      "Dezember",
    ],
    monthsShort: [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "Mai",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Okt",
      "Nov",
      "Dez",
    ],
    today: "Heute",
    now: "Jetzt",
  };
  var formatter = {
    date: function (date, settings) {
      let momentDate = new moment(date);
      return momentDate.format("DD.MM.YYYY");
    },
  };

  var calendarInit = function () {
    $(".check_in").calendar({
      type: "date",
      formatter: formatter,
      firstDayOfWeek: 1,
      endCalendar: $(".check_out"),
      text: text,
    });
    $(".check_out").calendar({
      type: "date",
      formatter: formatter,
      firstDayOfWeek: 1,
      startCalendar: $(".check_in"),
      text: text,
    });
  };

  $(".addBooking").click(function () {
    $(".modal-booking")
      .modal("setting", {
        onVisible: function () {
          calendarInit();
        },
      })
      .modal("show");
  });

  calendarInit();

  $(".typ.buttons .button").click(function (e) {
    e.preventDefault();
    $(".typ.buttons .button").removeClass("active");
    $(this).addClass("active");

    if ($(this).attr("data-typ") == "block") {
      // $('.modal-booking .content').removeClass("scrolling")
      $(".mieter-form").slideUp("400");
      $(".field-mieter, .field-anzahl").slideUp("400");
      $("#typ").val("block");
      var selectize = $(".selectize-mieter")[0].selectize;
      selectize.addOption({ value: "6", name: "Admin" });
      selectize.setValue("6", false);
    } else if ($(this).attr("data-typ") == "std") {
      $(".field-mieter, .field-anzahl").slideDown("400");
      $("#typ").val("std");
      // $('.modal-booking .content').addClass("scrolling")
    } else if ($(this).attr("data-typ") == "airbnb") {
      // $('.modal-booking .content').addClass("scrolling")
      $(".field-mieter, .field-anzahl").slideDown("400");
      $("#typ").val("airbnb");
    }
  });

  $(".selectize-mieter").selectize({
    create: function (input, callback) {
      $(".mieter-form").slideDown("400");

      $(".addMieter").on("click", function (e) {
        e.preventDefault();
        var vorname = $("#mieter_vorname").val();
        var name = $("#mieter_name").val();
        var email = $("#mieter_email").val();
        var telefon = $("#mieter_telefon").val();

        $.ajax({
          method: "POST",
          url: "/mieters",
          dataType: "json",
          data: {
            mieter: {
              vorname: vorname,
              name: name,
              email: email,
              telefon: telefon,
            },
          },
          success: function (response) {
            callback({
              value: response.id,
              text: `ID: ${response.id} / ${response.vorname} ${response.name}`,
            });
            // selectizeCallback = null;
            console.log(response);
            $(".mieter-form").slideUp("400");
          },
        });

        console.log(vorname, name, email, telefon);
      });
    },
    sortField: "text",
    render: {
      option_create: function (data, escape) {
        return (
          '<div class="create">Neuen Mieter erstellen: <strong>' +
          escape(data.input) +
          "</strong>&hellip;</div>"
        );
      },
    },
  });

  // Multiple images preview in browser
  var imagesPreview = function (input, placeToInsertImagePreview) {
    console.log("input", input);
    if (input.files) {
      var filesAmount = input.files.length;
      var i;

      for (i = 0; i < filesAmount; i++) {
        var reader = new FileReader();

        reader.onload = function (event) {
          $($.parseHTML("<img>"))
            .attr("src", event.target.result)
            .appendTo(placeToInsertImagePreview);
          $("#img-previews").show();
        };

        reader.readAsDataURL(input.files[i]);
      }
    }
  };

  $(".image-input").on("change", function () {
    imagesPreview(this, "div#img-previews");
  });
});
