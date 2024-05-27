import 'package:flutter/material.dart';
import 'package:frontend/screens/employees.dart';

// import 'package:google_fonts/google_fonts.dart';

// final colorScheme = ColorScheme.fromSeed(
//   brightness: Brightness.dark,
//   seedColor: Color.fromARGB(255, 128, 191, 239),
//   background: Color.fromARGB(255, 199, 235, 255),
// );

//create color scheme
var kColorScheme =
    ColorScheme.fromSeed(seedColor:Color.fromARGB(255, 4, 89, 169),);
var kDarkColorScheme =
    ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor:const Color.fromARGB(255, 5, 99, 125));

final theme = ThemeData().copyWith(
  // scaffoldBackgroundColor: kColorScheme.background,
  colorScheme: kColorScheme,
  appBarTheme: const AppBarTheme().copyWith(
    backgroundColor: kColorScheme.primary,
    foregroundColor: kColorScheme.primaryContainer
  ),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ElevatedButton.styleFrom(
  //     backgroundColor: kColorScheme.primaryContainer
  //   )
  // ),
  // textTheme: GoogleFonts.ubuntuCondensedTextTheme().copyWith(
  //   titleSmall: GoogleFonts.ubuntuCondensed(
  //     fontWeight: FontWeight.bold,
  //   ),
  //   titleMedium: GoogleFonts.ubuntuCondensed(
  //     fontWeight: FontWeight.bold,
  //   ),
  //   titleLarge: GoogleFonts.ubuntuCondensed(
  //     fontWeight: FontWeight.bold,
  //   ),
  // ),
);
final darkTheme = ThemeData.dark().copyWith(
          colorScheme: kDarkColorScheme,
      // cardTheme: const CardTheme().copyWith(
      //   color: kDarkColorScheme.secondaryContainer,
      //   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // ),
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      //   backgroundColor: kDarkColorScheme.primaryContainer,
      //   foregroundColor: kDarkColorScheme.onPrimaryContainer,
      //   ),
      // ),
);

void main() {
  runApp(
      const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employees',
      darkTheme: darkTheme,
      theme: theme,
      home: const EmployeeScreen(),
    );
  }
}