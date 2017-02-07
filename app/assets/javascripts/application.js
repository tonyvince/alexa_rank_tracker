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
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require zxcvbn
//= require global
//= require bootstrap/dropdown
//= require turbolinks
//= require_tree .

//= require highcharts/highstock
//= require highcharts/highcharts
//= require highcharts/highcharts-more
//= require highcharts/modules/exporting



$.validator.addMethod(
        "regex",
        function(value, element, regexp) {
            var re = new RegExp(regexp);
            return this.optional(element) || re.test(value);
        },
        "Please enter a valid URL (using http)"
);

$('#new_link').ready(function() {
  var password_validator = $('#new_link').validate({
    rules: {
      'alexa_rank[given_url]': {
        required: true,
        regex: "^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}"
      },
    },
    messages: {
      'alexa_rank[given_url]': {
        required: 'Please put in a URL',
      }
    }
  });
});
