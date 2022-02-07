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



  // DATATABLES CONFIGURATION
  $.extend(true, $.fn.dataTable.defaults, {
    lengthChange: false,
    paginate: false,
    buttons: [ 'copy', 'excel', 'pdf', 'print' ],
    drawCallback: function (settings) {
      $(".popup").popup();
    },
    language: {
        "emptyTable": "Keine Daten in der Tabelle vorhanden",
        "info": "_START_ bis _END_ von _TOTAL_ Einträgen",
        "infoEmpty": "Keine Daten vorhanden",
        "infoFiltered": "(gefiltert von _MAX_ Einträgen)",
        "infoThousands": ".",
        "loadingRecords": "Wird geladen ..",
        "processing": "Bitte warten ..",
        "paginate": {
            "first": "Erste",
            "previous": "Zurück",
            "next": "Nächste",
            "last": "Letzte"
        },
        "aria": {
            "sortAscending": ": aktivieren, um Spalte aufsteigend zu sortieren",
            "sortDescending": ": aktivieren, um Spalte absteigend zu sortieren"
        },
        "select": {
            "rows": {
                "_": "%d Zeilen ausgewählt",
                "1": "1 Zeile ausgewählt"
            },
            "cells": {
                "1": "1 Zelle ausgewählt",
                "_": "%d Zellen ausgewählt"
            },
            "columns": {
                "1": "1 Spalte ausgewählt",
                "_": "%d Spalten ausgewählt"
            }
        },
        "buttons": {
            "print": "Drucken",
            "copy": "Kopieren",
            "copyTitle": "In Zwischenablage kopieren",
            "copySuccess": {
                "_": "%d Zeilen kopiert",
                "1": "1 Zeile kopiert"
            },
            "collection": "Aktionen <span class=\"ui-button-icon-primary ui-icon ui-icon-triangle-1-s\"><\/span>",
            "colvis": "Spaltensichtbarkeit",
            "colvisRestore": "Sichtbarkeit wiederherstellen",
            "copyKeys": "Drücken Sie die Taste <i>ctrl<\/i> oder <i>⌘<\/i> + <i>C<\/i> um die Tabelle<br \/>in den Zwischenspeicher zu kopieren.<br \/><br \/>Um den Vorgang abzubrechen, klicken Sie die Nachricht an oder drücken Sie auf Escape.",
            "csv": "CSV",
            "excel": "Excel",
            "pageLength": {
                "-1": "Alle Zeilen anzeigen",
                "_": "%d Zeilen anzeigen"
            },
            "pdf": "PDF"
        },
        "autoFill": {
            "cancel": "Abbrechen",
            "fill": "Alle Zellen mit <i>%d<i> füllen<\/i><\/i>",
            "fillHorizontal": "Alle horizontalen Zellen füllen",
            "fillVertical": "Alle vertikalen Zellen füllen"
        },
        "decimal": ",",
        "search": "Suche:",
        "searchBuilder": {
            "add": "Bedingung hinzufügen",
            "button": {
                "0": "Such-Baukasten",
                "_": "Such-Baukasten (%d)"
            },
            "condition": "Bedingung",
            "conditions": {
                "date": {
                    "after": "Nach",
                    "before": "Vor",
                    "between": "Zwischen",
                    "empty": "Leer",
                    "not": "Nicht",
                    "notBetween": "Nicht zwischen",
                    "notEmpty": "Nicht leer",
                    "equals": "Gleich"
                },
                "number": {
                    "between": "Zwischen",
                    "empty": "Leer",
                    "equals": "Entspricht",
                    "gt": "Größer als",
                    "gte": "Größer als oder gleich",
                    "lt": "Kleiner als",
                    "lte": "Kleiner als oder gleich",
                    "not": "Nicht",
                    "notBetween": "Nicht zwischen",
                    "notEmpty": "Nicht leer"
                },
                "string": {
                    "contains": "Beinhaltet",
                    "empty": "Leer",
                    "endsWith": "Endet mit",
                    "equals": "Entspricht",
                    "not": "Nicht",
                    "notEmpty": "Nicht leer",
                    "startsWith": "Startet mit",
                    "notContains": "enthält nicht",
                    "notStarts": "startet nicht mit",
                    "notEnds": "endet nicht mit"
                },
                "array": {
                    "equals": "ist gleich",
                    "empty": "ist leer",
                    "contains": "enthält",
                    "not": "ist ungleich",
                    "notEmpty": "ist nicht leer",
                    "without": "aber nicht"
                }
            },
            "data": "Daten",
            "deleteTitle": "Filterregel entfernen",
            "leftTitle": "Äußere Kriterien",
            "logicAnd": "UND",
            "logicOr": "ODER",
            "rightTitle": "Innere Kriterien",
            "title": {
                "0": "Such-Baukasten",
                "_": "Such-Baukasten (%d)"
            },
            "value": "Wert",
            "clearAll": "Alle löschen"
        },
        "searchPanes": {
            "clearMessage": "Leeren",
            "collapse": {
                "0": "Suchmasken",
                "_": "Suchmasken (%d)"
            },
            "countFiltered": "{shown} ({total})",
            "emptyPanes": "Keine Suchmasken",
            "loadMessage": "Lade Suchmasken..",
            "title": "Aktive Filter: %d",
            "count": "Anzahl",
            "showMessage": "zeige Alle",
            "collapseMessage": "Alle einklappen"
        },
        "thousands": ".",
        "zeroRecords": "Keine passenden Einträge gefunden",
        "lengthMenu": "_MENU_ Zeilen anzeigen",
        "datetime": {
            "previous": "Vorher",
            "next": "Nachher",
            "hours": "Stunden",
            "minutes": "Minuten",
            "seconds": "Sekunden",
            "unknown": "Unbekannt",
            "weekdays": [
                "Sonntag",
                "Montag",
                "Dienstag",
                "Mittwoch",
                "Donnerstag",
                "Freitag",
                "Samstag"
            ],
            "months": [
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
                "Dezember"
            ]
        },
        "editor": {
            "close": "Schließen",
            "create": {
                "button": "Neu",
                "title": "Neuen Eintrag erstellen",
                "submit": "Neu"
            },
            "edit": {
                "button": "Ändern",
                "title": "Eintrag ändern",
                "submit": "ändern"
            },
            "remove": {
                "button": "Löschen",
                "title": "Löschen",
                "submit": "Löschen",
                "confirm": {
                    "_": "Sollen %d Zeilen gelöscht werden?",
                    "1": "Soll diese Zeile gelöscht werden?"
                }
            },
            "error": {
                "system": "Ein Systemfehler ist aufgetreten"
            },
            "multi": {
                "title": "Mehrere Werte",
                "info": "Die ausgewählten Elemente enthalten mehrere Werte für dieses Feld. Um alle Elemente für dieses Feld zu bearbeiten und auf denselben Wert zu setzen, klicken oder tippen Sie hier, andernfalls behalten diese ihre individuellen Werte bei.",
                "restore": "Änderungen zurücksetzen",
                "noMulti": "Dieses Feld kann nur einzeln bearbeitet werden, nicht als Teil einer Mengen-Änderung."
            }
        }
    }  
});


});
