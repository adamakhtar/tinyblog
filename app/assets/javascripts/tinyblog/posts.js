// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

ready = function(){

  var editor = new Editor($("textarea#post_body"));
  editor.render();
  
  options = {
    uploadUrl: $("textarea#post_body").data('image-upload-url'),
    extraParams: { 
      authenticity_token: $('input[name="authenticity_token"]').attr('value') 
    },
    allowedTypes: ["image/jpeg", "image/png", "image/jpg", "image/gif"],
    progressText: "![Uploading file...]()",
    urlText: "![file]({filename})",
    errorText: "Error uploading file"
  };

  // setup drag and drop images onto the editor via its codemirror
  inlineAttach.attachToCodeMirror(editor.codemirror, options);
}

$(document).ready(ready);
$(document).on('page:load', ready);

