void main() {
  String say(String from, String msg, [String device]) {
    var result = '$from say $msg';
    if (device != null) {
      result = '$result with a device';
    }
    return result;
  }

  String output = say('Bob', 'Howdy');

  print(output);
}
