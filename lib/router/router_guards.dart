import 'package:auto_route/auto_route.dart';
import 'package:dorimol/data/exceptions.dart';
import 'package:dorimol/data/services/token_service.dart';
import 'package:dorimol/router/router.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AuthGuard extends AutoRouteGuard {
  final TokenService tokenService = GetIt.I<TokenService>();
  final Talker talker = GetIt.I<Talker>();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    try {
      // TODO: Check token expired
      final accessTokenPayload = tokenService.parseAccessToken();
      talker.info("User authorized");
      if (accessTokenPayload.onboardingCompleted) {
        resolver.next(true);
      } else {
        router.push(const OnboardingRoute());
      }
    } on TokenException catch (_) {
      talker.info("User not authorized");
      router.push(const AuthorizationRoute());
    }
  }
}