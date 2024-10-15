import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278217312),
      surfaceTint: Color(4278217312),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4288606948),
      onPrimaryContainer: Color(4278198300),
      secondary: Color(4279133825),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4290505215),
      onSecondaryContainer: Color(4278198057),
      tertiary: Color(4278216820),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4288606205),
      onTertiaryContainer: Color(4278198052),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294245368),
      onSurface: Color(4279639324),
      onSurfaceVariant: Color(4282337607),
      outline: Color(4285495671),
      outlineVariant: Color(4290693574),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020976),
      inversePrimary: Color(4286764488),
      primaryFixed: Color(4288606948),
      onPrimaryFixed: Color(4278198300),
      primaryFixedDim: Color(4286764488),
      onPrimaryFixedVariant: Color(4278210632),
      secondaryFixed: Color(4290505215),
      onSecondaryFixed: Color(4278198057),
      secondaryFixedDim: Color(4287287534),
      onSecondaryFixedVariant: Color(4278209891),
      tertiaryFixed: Color(4288606205),
      onTertiaryFixed: Color(4278198052),
      tertiaryFixedDim: Color(4286764000),
      onTertiaryFixedVariant: Color(4278210392),
      surfaceDim: Color(4292205529),
      surfaceBright: Color(4294245368),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916146),
      surfaceContainer: Color(4293521389),
      surfaceContainerHigh: Color(4293126887),
      surfaceContainerHighest: Color(4292732129),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278209604),
      surfaceTint: Color(4278217312),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4280844662),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278208862),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281499032),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278209107),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4280647820),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294245368),
      onSurface: Color(4279639324),
      onSurfaceVariant: Color(4282074435),
      outline: Color(4283916639),
      outlineVariant: Color(4285758842),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020976),
      inversePrimary: Color(4286764488),
      primaryFixed: Color(4280844662),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278216798),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281499032),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278740094),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4280647820),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278216305),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292205529),
      surfaceBright: Color(4294245368),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916146),
      surfaceContainer: Color(4293521389),
      surfaceContainerHigh: Color(4293126887),
      surfaceContainerHighest: Color(4292732129),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278200355),
      surfaceTint: Color(4278217312),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278209604),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278199858),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4278208862),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4278200108),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4278209107),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294245368),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280034852),
      outline: Color(4282074435),
      outlineVariant: Color(4282074435),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281020976),
      inversePrimary: Color(4289199342),
      primaryFixed: Color(4278209604),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278203182),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4278208862),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4278202688),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4278209107),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4278202936),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292205529),
      surfaceBright: Color(4294245368),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4293916146),
      surfaceContainer: Color(4293521389),
      surfaceContainerHigh: Color(4293126887),
      surfaceContainerHighest: Color(4292732129),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4286764488),
      surfaceTint: Color(4286764488),
      onPrimary: Color(4278204209),
      primaryContainer: Color(4278210632),
      onPrimaryContainer: Color(4288606948),
      secondary: Color(4287287534),
      onSecondary: Color(4278203717),
      secondaryContainer: Color(4278209891),
      onSecondaryContainer: Color(4290505215),
      tertiary: Color(4286764000),
      onTertiary: Color(4278203965),
      tertiaryContainer: Color(4278210392),
      onTertiaryContainer: Color(4288606205),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279112979),
      onSurface: Color(4292732129),
      onSurfaceVariant: Color(4290693574),
      outline: Color(4287206288),
      outlineVariant: Color(4282337607),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292732129),
      inversePrimary: Color(4278217312),
      primaryFixed: Color(4288606948),
      onPrimaryFixed: Color(4278198300),
      primaryFixedDim: Color(4286764488),
      onPrimaryFixedVariant: Color(4278210632),
      secondaryFixed: Color(4290505215),
      onSecondaryFixed: Color(4278198057),
      secondaryFixedDim: Color(4287287534),
      onSecondaryFixedVariant: Color(4278209891),
      tertiaryFixed: Color(4288606205),
      onTertiaryFixed: Color(4278198052),
      tertiaryFixedDim: Color(4286764000),
      onTertiaryFixedVariant: Color(4278210392),
      surfaceDim: Color(4279112979),
      surfaceBright: Color(4281613113),
      surfaceContainerLowest: Color(4278783758),
      surfaceContainerLow: Color(4279639324),
      surfaceContainer: Color(4279902496),
      surfaceContainerHigh: Color(4280625962),
      surfaceContainerHighest: Color(4281349685),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4287027916),
      surfaceTint: Color(4286764488),
      onPrimary: Color(4278196759),
      primaryContainer: Color(4283080339),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4287550706),
      onSecondary: Color(4278196514),
      secondaryContainer: Color(4283603638),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4287027173),
      onTertiary: Color(4278196765),
      tertiaryContainer: Color(4283014313),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279112979),
      onSurface: Color(4294376697),
      onSurfaceVariant: Color(4291022282),
      outline: Color(4288390562),
      outlineVariant: Color(4286285187),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292732129),
      inversePrimary: Color(4278211145),
      primaryFixed: Color(4288606948),
      onPrimaryFixed: Color(4278195474),
      primaryFixedDim: Color(4286764488),
      onPrimaryFixedVariant: Color(4278206007),
      secondaryFixed: Color(4290505215),
      onSecondaryFixed: Color(4278194971),
      secondaryFixedDim: Color(4287287534),
      onSecondaryFixedVariant: Color(4278205261),
      tertiaryFixed: Color(4288606205),
      onTertiaryFixed: Color(4278195223),
      tertiaryFixedDim: Color(4286764000),
      onTertiaryFixedVariant: Color(4278205508),
      surfaceDim: Color(4279112979),
      surfaceBright: Color(4281613113),
      surfaceContainerLowest: Color(4278783758),
      surfaceContainerLow: Color(4279639324),
      surfaceContainer: Color(4279902496),
      surfaceContainerHigh: Color(4280625962),
      surfaceContainerHighest: Color(4281349685),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4293656570),
      surfaceTint: Color(4286764488),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4287027916),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294376447),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4287550706),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294049279),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4287027173),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279112979),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294180346),
      outline: Color(4291022282),
      outlineVariant: Color(4291022282),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292732129),
      inversePrimary: Color(4278202411),
      primaryFixed: Color(4288870120),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4287027916),
      onPrimaryFixedVariant: Color(4278196759),
      secondaryFixed: Color(4291292671),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4287550706),
      onSecondaryFixedVariant: Color(4278196514),
      tertiaryFixed: Color(4289393663),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4287027173),
      onTertiaryFixedVariant: Color(4278196765),
      surfaceDim: Color(4279112979),
      surfaceBright: Color(4281613113),
      surfaceContainerLowest: Color(4278783758),
      surfaceContainerLow: Color(4279639324),
      surfaceContainer: Color(4279902496),
      surfaceContainerHigh: Color(4280625962),
      surfaceContainerHighest: Color(4281349685),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
