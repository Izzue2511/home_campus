import 'package:encrypt/encrypt.dart';

class AESHelper {
  static final key = Key.fromLength(32); // AES-256 requires a 32-byte key
  static final iv = IV.fromLength(16); // AES uses a 16-byte IV

  static String encrypt(String plainText) {
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv);
    return encrypted.base64;
  }

  static String decrypt(String encryptedText) {
    final encrypter = Encrypter(AES(key));
    final decrypted =
    encrypter.decrypt(Encrypted.fromBase64(encryptedText), iv: iv);
    return decrypted;
  }
}
