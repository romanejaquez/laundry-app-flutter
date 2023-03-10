import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:laundry_app/firebase_options.dart';
import 'package:laundry_app/helpers/laundry_styles.dart';
import 'package:laundry_app/helpers/utils.dart';
import 'package:laundry_app/pages/landing_page.dart';
import 'package:laundry_app/pages/main_page.dart';
import 'package:laundry_app/pages/orders/order_history.dart';
import 'package:laundry_app/pages/orders/order_search.dart';
import 'package:laundry_app/pages/orders_page.dart';
import 'package:laundry_app/pages/mobile/qrscanner_page.dart';
import 'package:laundry_app/pages/quick_dropoff_page.dart';
import 'package:laundry_app/pages/services_page.dart';
import 'package:laundry_app/pages/settings_page.dart';
import 'package:laundry_app/pages/splash_page.dart';
import 'package:laundry_app/services/amount_garment_services_selection.dart';
import 'package:laundry_app/services/garment_options_service.dart';
import 'package:laundry_app/services/laundry_header_options_service.dart';
import 'package:laundry_app/services/laundry_left_tab_nav_service.dart';
import 'package:laundry_app/services/laundry_theme_service.dart';
import 'package:laundry_app/services/order_completion_service.dart';
import 'package:laundry_app/services/order_processing_service.dart';
import 'package:laundry_app/services/order_received_notification_service.dart';
import 'package:laundry_app/services/order_tab_selection_service.dart';
import 'package:laundry_app/services/printing_service.dart';
import 'package:laundry_app/services/qrscan_data_service.dart';
import 'package:laundry_app/services/quickdropoff_service.dart';
import 'package:laundry_app/services/service_steps_service.dart';
import 'package:laundry_app/services/services_option_service.dart';
import 'package:laundry_app/services/side_panel_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await checkPerm();
  Map<Permission, PermissionStatus> statuses = await [
      Permission.bluetooth,
      Permission.bluetoothScan,
      Permission.bluetoothConnect,
      Permission.bluetoothAdvertise,
      Permission.location,
    ].request();

  runApp(
    MultiProvider(
      providers: [
        Provider(create: (_) => LaundryHeaderOptionsService()),
        Provider(create: (_) => QRScanDataService()),
        Provider(create: (_) => OrderProcessingService()),
        Provider(create: (_) => PrintingService()),
        ChangeNotifierProvider(create: (_) => ServicesOptionService()),
        ChangeNotifierProvider(create: (_) => LaundryLeftTabNavService()),
        ChangeNotifierProvider(create: (_) => QuickDropoffService()),
        ChangeNotifierProvider(create: (_) => OrderTabSelectionService()),
        ChangeNotifierProvider(create: (_) => ServiceStepsService()),
        ChangeNotifierProvider(create: (_) => GarmentOptionsService()),
        ChangeNotifierProvider(create: (_) => SidePanelService()),
        ChangeNotifierProvider(create: (_) => OrderReceivedNotificationService()),
        ChangeNotifierProvider(create: (_) => LaundryThemeService()),
        ChangeNotifierProvider(create: (_) => AmountGarmentServicesSelection()),
        ChangeNotifierProvider(create: (_) => OrderCompletionService()),
      ],
      child: const LaundryApp()
    )
  );
}

Future<void> checkPerm() async {    
  var status = await Permission.bluetooth.status;
  if (status.isDenied) {
  
    await Permission.bluetooth.request();
  }

  if (await Permission.bluetooth.status.isPermanentlyDenied) {
    openAppSettings();
  }
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
      builder: (BuildContext context, Widget? child) {
        return Consumer<LaundryThemeService>(
          
          builder: (context, service, c) {
            LaundryStyles.setTheme(service.currentTheme);

            context.read<AmountGarmentServicesSelection>().setContext(context);
            context.read<ServiceStepsService>().setContext(context);
            context.read<LaundryLeftTabNavService>().setContext(context);

            return child!;
          },
        );
      },
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      theme: ThemeData(
        fontFamily: 'Product Sans'
      )
    );
  }
}