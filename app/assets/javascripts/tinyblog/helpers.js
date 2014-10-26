//used to make links create a popup window instead of leaving current page
//handy for social links
function popitup(url) {
  newwindow=window.open(url,'name','height=200,width=300');
  if (window.focus) {newwindow.focus()}
  return false;
}