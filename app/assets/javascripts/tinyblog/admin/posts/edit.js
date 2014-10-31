window.unloadDirtyMessage = function () {
    return '==============================\n\n' +
        'Hey there! It looks like you\'re in the middle of writing' +
        ' something and you haven\'t saved all of your content.' +
        '\n\nSave before you go!\n\n' +
        '==============================';
};

window.setDirty = function(isDirty){
  window.onbeforeunload = isDirty ? unloadDirtyMessage : null;
};

