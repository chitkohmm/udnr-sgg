import 'package:flutter/services.dart';
import 'package:vexana/vexana.dart';

abstract class IDownloadService {
  final INetworkManager manager;
  IDownloadService(this.manager);
  Future<Uint8List?> downloadFile(String url, ProgressCallback callback);
}

class DownloadService extends IDownloadService {
  DownloadService(INetworkManager manager) : super(manager);

  @override
  Future<Uint8List?> downloadFile(String url, ProgressCallback callback) async {
    final response = await manager.downloadFileSimple(url, callback);
    if (response.data is Uint8List) {
      return Uint8List.fromList(response.data ?? []);
    }
    return null;
  }
}
