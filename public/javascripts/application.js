// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

var index = 0;
var i_persist;
$("#new_avail").click(function() {
  var fields = $("#avail_fields");
  var clone = fields.clone();
  
  var inputs = fields.children("input[name^='meeting']");
  inputs.each(function (i, element) {
    element = $(element);
	var name = element.attr("name");
	name = name.replace(index, index + 1);
	element.attr("name", name);
  });
  
  clone.insertBefore(fields);
  index++;

  return false;
});
