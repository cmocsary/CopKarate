function pressEnter() {
  var robot = Java.type('java.awt.Robot');
  var keyEvent = Java.type('java.awt.event.KeyEvent');
  var r = new robot();
  r.keyPress(keyEvent.VK_ENTER);
  r.keyRelease(keyEvent.VK_ENTER);
}