import 'package:firebase_core/firebase_core.dart';
import 'package:flix_id/firebase_options.dart';
import 'package:flix_id/presentation/misc/constants.dart';
import 'package:flix_id/presentation/providers/router/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      theme: ThemeData.from(
          colorScheme: ColorScheme.fromSeed(
              seedColor: blue,
              background: backgroundColor,
              brightness: Brightness.light),
          useMaterial3: true,
          textTheme: TextTheme(
            bodyMedium: GoogleFonts.poppins(color: blue),
            bodyLarge: GoogleFonts.poppins(color: Colors.black),
            labelLarge: GoogleFonts.poppins(color: backgroundColor),
          )),
      debugShowCheckedModeBanner: false,
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routeInformationProvider:
          ref.watch(routerProvider).routeInformationProvider,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
    );
  }
}
