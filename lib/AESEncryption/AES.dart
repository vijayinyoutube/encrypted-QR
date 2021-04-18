import 'package:encrypt/encrypt.dart' as encrypt;

class AESEncryption {
  final plainText = 'Hello World';
  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));

  encryptMsg() => encrypter.encrypt(plainText, iv: iv);

  decryptMsg(encrypt.Encrypted text) => encrypter.decrypt(text, iv: iv);
}
