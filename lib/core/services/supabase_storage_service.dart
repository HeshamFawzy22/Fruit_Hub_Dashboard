import 'dart:io';

import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../constants.dart';
import 'storage_service.dart';

class SupabaseStorageService implements StorageService {
  static late Supabase _supabase;
  static initSupabase() async {
    _supabase = await Supabase.initialize(
      url: kSupabaseUrl,
      anonKey: kSupabaseKey,
    );
  }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    // String extensionName = b.extension(file.path);
    await _supabase.client.storage
        .from(kFruitsImagesBucket)
        .upload('$path/$fileName', file);
    final String publicUrl = _supabase.client.storage
        .from(kFruitsImagesBucket)
        .getPublicUrl('$path/$fileName');
    return publicUrl;
  }
}
