$(function() {
if ($('html').hasClass('no-touch')) {
  var datetimeFields = $('input[type=datetime-local]');
  var dateFields = $('input[type=date]');
  if (datetimeFields.length > 0 || dateFields.length > 0) {
    datetimeFields.attr('type', 'text');
    datetimeFields.datetimepicker({
      format: 'Y-m-d H:i'
    });
    dateFields.attr('type', 'text');
    dateFields.datetimepicker({
      timepicker: false,
      format: 'Y-m-d'
    });
  }
}

var textarea = $('textarea#notes_entry_body').hide();

if (textarea.length > 0) {
  var editor = ace.edit('notes_entry_editor');
  editor.setTheme('ace/theme/github');
  editor.getSession().setMode('ace/mode/markdown');
  editor.getSession().setValue(textarea.val());
  editor.getSession().on('change', function() {
    return textarea.val(editor.getSession().getValue());
  });
}

var allowancePayeeInput = $("#allowance_entry_payee");

if (allowancePayeeInput.length) {
  var allowanceCategoryInput = $("#allowance_entry_category");
  $.getJSON("/admin/allowance/autocompleter.json", function(data) {
    allowancePayeeInput.autocomplete({
      source: data.payees
    });
    return allowanceCategoryInput.autocomplete({
      source: data.categories
    });
  });
}

var taskList = $('#task-list');

if (taskList.length) {
  var successValue = $('td#success');
  var locationParts = window.location.href.split('/');
  var lastIndex = locationParts.length - 1;
  var recordNumber = locationParts[lastIndex];
  taskList.find('input').on('click', function(e) {
    var completed, task;
    task = this.name;
    completed = this.checked;
    return $.ajax({
      type: 'PUT',
      url: "/admin/points/daily_tasks/" + recordNumber + "/task_update",
      data: {
        task: task,
        completed: completed
      }
    }).done(function(msg) {
      return successValue.text(msg + "%");
    });
  });
}

var allowanceTaskForm = $(".edit_allowance_task");

if (allowanceTaskForm.length > 0) {
  var days = [];
  allowanceTaskForm.find("input[type=checkbox]").each(function(index, box) {
    if ($(box).prop("checked")) {
      days.push($(box).val());
    }
    return $(box).closest("label").on("click", function(event) {
      var checked, input;
      input = $(this).find("input");
      checked = input.prop("checked");
      if (checked) {
        if (days.indexOf(input.val()) < 0) {
          days.push(input.val());
        }
      } else {
        index = days.indexOf(input.val());
        days.splice(index, 1);
      }
      return $.ajax({
        type: "PUT",
        url: allowanceTaskForm.prop("action"),
        dataType: "json",
        data: {
          allowance_task: {
            days: days
          }
        },
        success: function() {
          if (days.length === 7) {
            return window.location = "/admin/allowance";
          }
        }
      });
    });
  });
}
});