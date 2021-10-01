import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart' as path;

class DownloadHelper {
  final dio = Dio();
  Future<String> downloadVideo(String urlPath, String savePath) async {
    var directory  = await path.getTemporaryDirectory();
    var path1 = directory.path + '/' + savePath;
    return dio.download(urlPath, path1)
      .then((value){
        if (value.statusCode == 200){
          print(path1);
          return Future.value(path1);
        }
        else {
          return Future.error('No se pudo descargar el archivo');
        }
      }
    ); 
  }
}
