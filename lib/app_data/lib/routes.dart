import 'package:exodus/app_data/app_data.dart';
import 'package:exodus/features/auth/presentation/welcome/welcome.dart';
import 'package:exodus/features/home/presentation/home_screen.dart';
import 'package:exodus/features/init/presentation/init.dart';
import 'package:exodus/features/txApp/feature/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _routes = RoutesList();

final GlobalKey<NavigatorState> rootNavigator = GlobalKey(debugLabel: 'root');

class RoutesList {
  final String init = '/';

  // WelcomeScreens
  String get _welcomeScreenName => 'welcome';
  String get welcomeScreen => '$init$_welcomeScreenName';

  // Create new wallet

  String get _createWalletScreenName => 'createWallet';
  String get createWalletScreenScreen =>
      '$welcomeScreen/$_createWalletScreenName';

  // Home

  String get _homeScreenName => 'homeScreen';
  String get homeScreen => '$init$_homeScreenName';

  // Tx App
  // ---------------------

  // Dashboard
  //// Bank Account
  String get _welcomeTxScreenName => 'welcomeTxScreen';
  String get welcomeTxScreen => '/$_welcomeTxScreenName';
  // Bank Account
  String get _bankAccountScreenName => 'bankAccountScreen';
  String get bankAccountScreen => '/$_bankAccountScreenName';

  // Category
  String get _categoryScreenName => 'categoryScreen';
  String get categoryScreen => '/$_categoryScreenName';

  // Operation
  String get _operationScreenName => 'operationScreen';
  String get operationScreen => '/$_operationScreenName';

  // Review
  String get _reviewScreenName => 'reviewScreen';
  String get reviewScreen => '/$_reviewScreenName';

  // Pincode
  String get _pincodeScreenName => 'pincodeScreen';
  String get pincodeScreen => '$init$_pincodeScreenName';

  // Loading
  String get _loadingScreenName => 'loadingScreen';
  String get loadingScreen => '$init$_loadingScreenName';

  // Loading
  String get _txAppScreenName => 'txAppScreen';
  String get txAppScreen => '$init$_txAppScreenName';
}

class Routes {
  Routes();

  String init = AppData.routes.init;

  late final GoRouter routerConfig = GoRouter(
    navigatorKey: rootNavigator,
    initialLocation: init,
    routes: [
      GoRoute(
        path: AppData.routes.init,
        builder: (BuildContext context, GoRouterState state) {
          return const InitPage();
        },
        routes: [
          GoRoute(
            path: AppData.routes._welcomeScreenName,
            builder: (BuildContext context, GoRouterState state) {
              return const WelcomeScreen();
            },
            routes: const [],
          ),
          GoRoute(
            path: AppData.routes._homeScreenName,
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
          ),
        ],
      ),
      GoRoute(
        path: AppData.routes.txAppScreen,
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
      ),

      // GoRoute(
      //   path: AppData.routes.welcomeTxScreen,
      //   builder: (context, state) => WelcomeTxAppScreen(
      //     key: state.pageKey,
      //   ),
      // ),

      // //Tx App
      // ShellRoute(
      //   navigatorKey: shellNavigator,
      //   builder: (context, state, child) => DashboardPage(
      //     key: state.pageKey,
      //     child: child,
      //   ),
      //   observers: [
      //     BottomBarNavObserver(),
      //   ],
      //   routes: [
      //     GoRoute(
      //       path: AppData.routes.bankAccountScreen,
      //       builder: (context, state) => AccountPage(
      //         key: state.pageKey,
      //       ),
      //     ),
      //     GoRoute(
      //       path: AppData.routes.categoryScreen,
      //       builder: (context, state) => CategoryPage(
      //         key: state.pageKey,
      //       ),
      //     ),
      //     GoRoute(
      //       path: AppData.routes.operationScreen,
      //       builder: (context, state) => OperationPage(
      //         key: state.pageKey,
      //       ),
      //     ),
      //     GoRoute(
      //       path: AppData.routes.reviewScreen,
      //       builder: (context, state) => ExchangePage(
      //         key: state.pageKey,
      //       ),
      //     ),
      //   ],
      // ),
      // GoRoute(
      //   path: AppData.routes.pincodeScreen,
      //   builder: (BuildContext context, GoRouterState state) {
      //     return const PasswordInputPage();
      //   },
      // ),
    ],
  );
}
