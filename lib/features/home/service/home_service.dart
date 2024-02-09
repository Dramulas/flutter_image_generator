import 'package:dalle_flutter_mobile_app/product/enum/service_paths.dart';
import 'package:dio/dio.dart';

import '../model/dalle_model.dart';
import '../../../core/init/network/network_manager.dart';

class HomeService {
  static HomeService? _instance;
  static HomeService get instance => _instance ??= HomeService._init();
  HomeService._init();

  Future getImage({required String prompt, required String apiKey}) async {
    return await NetworkManager.instance?.dioPost(
      ServicePaths.imageGenerator.path,
      options: Options(
        headers: {
          "Authorization": "Bearer $apiKey",
          'Content-Type': 'application/json',
        },
      ),
      data: {
        "model": "dall-e-3",
        "prompt": prompt,
        "n": 1,
        // "size": "256x256",
        "size": "1024x1024",
        "quality": "standard",
        "response_format": "b64_json",
      },
      model: DallEModel(),
    );
  }
}
