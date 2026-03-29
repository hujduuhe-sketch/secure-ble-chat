import 'dart:convert';
import 'package:encrypt/encrypt.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'dart:typed_data';

class EncryptionService {
  final Key key;
  final IV iv;

  EncryptionService(String keyString)
      : key = Key.fromUtf8(keyString.padRight(32, '0')), // AES-256 key size
        iv = IV.fromLength(16); // 16 bytes for AES

  String encryptData(String plaintext) {
    final encrypter = Encrypter(AES(key));
    final encrypted = encrypter.encrypt(plaintext, iv: iv);
    return encrypted.base64;
  }

  String decryptData(String encryptedText) {
    final encrypter = Encrypter(AES(key));
    final decrypted = encrypter.decrypt(Encrypted.fromBase64(encryptedText), iv: iv);
    return decrypted;
  }
}