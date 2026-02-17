import 'package:get/get.dart';
import 'package:mobile/app/data/providers/home_provider.dart';

class HomeRepository {
  final HomeProvider provider;

  HomeRepository(this.provider);

  Future<Response> fetchWalletSummary() async {
    return await provider.fetchWalletSummary();
  }
}