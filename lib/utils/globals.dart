library globals;
import "dart:convert";

String email;
String password;

void setCredentials(String eMail, String passWord) {
  email = eMail;
  password = passWord;
}

String getEmail() {
  return email;
}

String getPassword() {
  return password;
}

String getEncondedCredentials() {
  Codec<String, String> stringToBase64 = utf8.fuse(base64);
  return stringToBase64.encode("$email:$password");
}
