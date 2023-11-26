part of 'global_settings_bloc.dart';

@immutable
sealed class GlobalSettingsEvent {
  const GlobalSettingsEvent();
}

final class ChangeTheme extends GlobalSettingsEvent {
  const ChangeTheme({
    required this.globalMode,
    required this.lightMode,
    required this.darkMode,
  });

  final String globalMode;
  final int lightMode;
  final int darkMode;
}

final class ChangePrimaryColor extends GlobalSettingsEvent {
  const ChangePrimaryColor({required this.primaryColor});

  final int primaryColor;
}

final class ChangeLang extends GlobalSettingsEvent {
  const ChangeLang({required this.lang});

  final String lang;
}
