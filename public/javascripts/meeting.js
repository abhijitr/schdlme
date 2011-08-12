$(document).ready(function() {


   var $calendar = $('#calendar');
   var $data = $('#calendar-data');
   var $form = $('#calendar-form');
   var isEditMode = ($data.length == 0);
   var id = 10;

   $calendar.weekCalendar({
      displayOddEven:true,
      timeslotsPerHour : 2,
      allowCalEventOverlap : false,
      overlapEventsSeparate: true,
      firstDayOfWeek : 1,
      businessHours :{start: 8, end: 18, limitDisplay: false},
      daysToShow : 7,
      switchDisplay: {'work week': 5, 'full week': 7},
      readonly: !isEditMode,
      title: function(daysToShow) {
          return daysToShow == 1 ? '%date%' : '%start% - %end%';
      },
      height : function($calendar) {
         return $(window).height() - $("header").outerHeight() - 1;
      },
      eventRender : function(calEvent, $event) {

      },
      draggable : function(calEvent, $event) {
         return calEvent.readOnly != true;
      },
      resizable : function(calEvent, $event) {
         return calEvent.readOnly != true;
      },
      eventNew : function(calEvent, $event) {
      },
      eventDrop : function(calEvent, $event) {
      },
      eventResize : function(calEvent, $event) {
      },
      eventClick : function(calEvent, $event) {
      },
      eventMouseover : function(calEvent, $event) {
      },
      eventMouseout : function(calEvent, $event) {
      },
      noEvents : function() {
      },
      data : function(start, end, callback) {
         callback(getEventData());
      }
   });

   function getEventData() {
      var events = [];

      if (!isEditMode) {
        var $avails = $data.find('.availability');

        $avails.each(function(i, avail) {
          var $start = $(avail).find(".start");
          var $end = $(avail).find(".end");
          var ev = {id: i,
                    start: new Date($start.html()),
                    end: new Date($end.html()),
                    title: 'Available',
                    readOnly: true};
          events.push(ev);
        });
      }

      return { events: events };
   }

   $("#new_meeting").submit(function(e) {
     // Collect all the events defined in the calendar
     // and stick them in the form.

     var $events = $(".wc-cal-event");
     $events.each(function(i, event) {
       var fieldPrefix = "meeting[availabilities_attributes]["+i+"]";
       var calEvent = $(event).data('calEvent');
       var data = {start: calEvent.start.toString('M/d/yyyy HH:mm'),
                   end: calEvent.end.toString('M/d/yyyy HH:mm'),
                   duration: 30}; // default to 30 min slots for now

       for (field in data) {
         var fieldName = fieldPrefix + "[" + field + "]";
         var $input = $("<input name='"+fieldName+"' type='text' value='" + data[field] + "' />");
         $form.append($input);
       }
     });
     
     return true;
   });
});
