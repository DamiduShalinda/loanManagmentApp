
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {

   static const  _storage = FlutterSecureStorage();
   static const _acessTokenKey = 'acess';
   static const _refreshTokenKey = 'refresh';

    static Future setAcessToken (dynamic token) async => 
        await _storage.write(key: _acessTokenKey, value: token);

    static Future<String?> getAcessToken () async =>
        await _storage.read(key: _acessTokenKey);

    static Future setRefreshToken (dynamic token) async => 
        await _storage.write(key: _refreshTokenKey, value: token);

    static Future<String?> getRefreshToken () async =>
        await _storage.read(key: _refreshTokenKey);

    static Future deleteTokens () async {
      await _storage.delete(key: _acessTokenKey);
      await _storage.delete(key: _refreshTokenKey);
    }

    
}