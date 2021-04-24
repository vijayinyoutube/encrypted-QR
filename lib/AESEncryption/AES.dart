import 'package:encrypt/encrypt.dart' as encrypt;

class AESEncryption {
  static final key = encrypt.Key.fromLength(32);
  static final iv = encrypt.IV.fromLength(16);
  static final encrypter = encrypt.Encrypter(encrypt.AES(key));

  encryptMsg(String text) => encrypter.encrypt(text, iv: iv);

  decryptMsg(encrypt.Encrypted text) => encrypter.decrypt(text, iv: iv);

  getCode(String encoded) {
    var temp = encrypt.IV.fromBase16(encoded);
    return temp;
  }

  getCode1(String encoded) {
    var temp = encrypt.Encrypted.fromBase16(encoded);
    return temp;
  }
}
