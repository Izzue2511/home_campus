import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';

class EncryptionHelper {
  static final iv = generateRandomIV();
  static final key = generateRandomKey();

  static Uint8List generateRandomIV() {
    final random = Random.secure();
    final iv = List<int>.generate(16, (_) => random.nextInt(256));
    return Uint8List.fromList(iv);
  }

  static Uint8List generateRandomKey() {
    final random = Random.secure();
    final key = List<int>.generate(16, (_) => random.nextInt(256));
    return Uint8List.fromList(key);
  }

  static String encryptData(String data) {
    final encrypter = Encrypter(AES(Key(key)));
    final encrypted = encrypter.encrypt(data, iv: IV(iv));
    return encrypted.base64;
  }

  static String decryptData(String encryptedData) {
    final encrypter = Encrypter(AES(Key(key)));
    final encrypted = Encrypted.fromBase64(encryptedData);
    final decrypted = encrypter.decrypt(encrypted, iv: IV(iv));
    return decrypted;
  }
}
