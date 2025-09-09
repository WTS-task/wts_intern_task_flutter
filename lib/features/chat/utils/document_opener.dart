import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class DocumentOpener {
  static Future<OpenResult> open(String url) async {
    final String filePath = await _resolveToLocalPath(url);
    return OpenFile.open(filePath);
  }

  static Future<String> _resolveToLocalPath(String url) async {
    final bool isNetwork = url.startsWith('http://') || url.startsWith('https://');
    if (!isNetwork) return url;
    final tempDir = await getTemporaryDirectory();
    final fileName = url.split('/').last;
    final file = File('${tempDir.path}/$fileName');

    if (await file.exists()) {
      // Файл уже загружен ранее — возвращаем путь
      return file.path;
    }

    final response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('Ошибка загрузки файла');
    }
    await file.writeAsBytes(response.bodyBytes);
    return file.path;
  }
}


