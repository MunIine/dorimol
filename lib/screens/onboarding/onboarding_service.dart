import 'package:dorimol/api/api.dart';
import 'package:dorimol/data/services/token_service.dart';
import 'package:get_it/get_it.dart';

class OnboardingService {
  Future<void> completeOnboarding(String name, String? city, String? address) async {
    final tokenService = GetIt.I<TokenService>();
    final data = {
      "name": name,
      "onboarding_completed": true,
    };
    if (city != null && address != null) {
      data.addAll({
        "address": address,
        "city": city,
      });
    }

    final tokens = await GetIt.I<DorimolApiClient>().updateUser('Bearer ${tokenService.accessToken!}', data);
    await tokenService.saveTokens(accessToken: tokens.accessToken, refreshToken: tokens.refreshToken);
  }
}