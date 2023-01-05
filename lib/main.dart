import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/pages/landing_page.dart';
import 'package:laundry_app/pages/main_page.dart';
import 'package:laundry_app/pages/orders/order_history.dart';
import 'package:laundry_app/pages/orders/order_search.dart';
import 'package:laundry_app/pages/orders_page.dart';
import 'package:laundry_app/pages/qrscanner_page.dart';
import 'package:laundry_app/pages/quick_dropoff_page.dart';
import 'package:laundry_app/pages/services_page.dart';
import 'package:laundry_app/pages/settings_page.dart';
import 'package:laundry_app/pages/splash_page.dart';
import 'package:laundry_app/services/laundry_header_options_service.dart';
import 'package:laundry_app/services/laundry_left_tab_nav_service.dart';
import 'package:laundry_app/services/order_tab_selection_service.dart';
import 'package:laundry_app/services/quickdropoff_service.dart';
import 'package:laundry_app/services/services_option_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => LaundryHeaderOptionsService()),
        Provider(create: (_) => ServicesOptionService()),
        ChangeNotifierProvider(create: (_) => LaundryLeftTabNavService()),
        ChangeNotifierProvider(create: (_) => QuickDropoffService()),
        ChangeNotifierProvider(create: (_) => OrderTabSelectionService()),
      ],
      child: const LaundryApp()
    )
  );
}

class LaundryApp extends StatelessWidget {

  static final _router = GoRouter(
    initialLocation: '/splash',
    navigatorKey: Utils.rootNavigatorKey,
    routes: [
      GoRoute(
        parentNavigatorKey: Utils.rootNavigatorKey,
        path: '/splash',
        builder: (context, state) => const SplashPage(key: Key('splash screen')),
      ),
      GoRoute(
        parentNavigatorKey: Utils.rootNavigatorKey,
        path: '/landing',
        builder: (context, state) => const LandingPage(key: Key('landing screen')),
      ),
      GoRoute(
        parentNavigatorKey: Utils.rootNavigatorKey,
        path: '/qrscanner',
        builder: (context, state) => const QRScannerPage(key: Key('qr scanner screen')),
      ),
      ShellRoute(
        navigatorKey: Utils.mainPageNavigatorKey,
        builder: ((context, state, child) {
          return MainPage(child: child);
        }),
        routes: [
          GoRoute(
            parentNavigatorKey: Utils.mainPageNavigatorKey,
            path: '/services',
            pageBuilder: ((context, state) {
              return const NoTransitionPage(
                child: ServicesPage(key: Key('services'))
              );
            })
          ),
          ShellRoute(
            navigatorKey: Utils.orderPageNavigationKey,
            pageBuilder: ((context, state, child) {
              return NoTransitionPage(
                child: OrdersPage(child: child)
              );
            }),
            routes: [
              GoRoute(
                parentNavigatorKey: Utils.orderPageNavigationKey,
                path: '/ordersearch',
                pageBuilder: ((context, state) {
                  return const NoTransitionPage(
                    child: OrderSearch(key: Key('services'))
                  );
                }) 
              ),
              GoRoute(
                parentNavigatorKey: Utils.orderPageNavigationKey,
                path: '/orderhistory',
                pageBuilder: ((context, state) {
                  return const NoTransitionPage(
                    child: OrderHistory(key: Key('services'))
                  );
                }) 
              ),
            ]
          ),
          // GoRoute(
          //   parentNavigatorKey: Utils.mainPageNavigatorKey,
          //   path: '/orders',
          //   pageBuilder: ((context, state) {
          //     return const NoTransitionPage(
          //       child: OrdersPage(key: Key('services'))
          //     );
          //   }) 
          // ),
          GoRoute(
            parentNavigatorKey: Utils.mainPageNavigatorKey,
            path: '/settings',
            pageBuilder: ((context, state) {
              return const NoTransitionPage(
                child: SettingsPage(key: Key('services'))
              );
            })  
          ),
          GoRoute(
            parentNavigatorKey: Utils.mainPageNavigatorKey,
            path: '/quickdropoff',
            pageBuilder: ((context, state) {
              return const NoTransitionPage(
                child: QuickDropoffPage(key: Key('quickdropoff'))
              );
            })  
          )
        ]
      )
    ],
  );
  
  const LaundryApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Laundry App",
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      theme: ThemeData(
        fontFamily: 'Product Sans'
      )
    );
  }
}