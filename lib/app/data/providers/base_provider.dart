import 'package:get/get.dart';
import 'package:mobile/app/core/storages/token_storage.dart';
import 'package:mobile/app/routes/app_pages.dart';

class BaseProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'http://10.0.2.2:3000';

    httpClient.addRequestModifier<dynamic>(
      (request) async {
        final token = await TokenStorage().getToken();

        if (token != null) {
          request.headers['Authorization'] = 'Bearer $token';
        }
        return request;
      },
    );

    httpClient.addResponseModifier(
      (request, response) {
        if (response.statusCode == 401) {
          Get.offAllNamed(Routes.LOGIN);
        }
        return response;
      },
    );

    super.onInit();
  }
}
