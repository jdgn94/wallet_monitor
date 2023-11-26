part of 'global_settings_bloc.dart';

@immutable
sealed class GlobalSettingsState {
  const GlobalSettingsState({
    required this.globalMode,
    required this.lightMode,
    required this.darkMode,
    required this.primaryColor,
    required this.lang,
  });

  final String globalMode;
  final int lightMode;
  final int darkMode;
  final int primaryColor;
  final String lang;

  List<Object> get props => [
        globalMode,
        lightMode,
        darkMode,
        primaryColor,
        lang,
      ];
}

final class GlobalSettingsInitial extends GlobalSettingsState {
  const GlobalSettingsInitial({
    required super.globalMode,
    required super.lightMode,
    required super.darkMode,
    required super.primaryColor,
    required super.lang,
  });
}

final class UpdateGlobalSettingsState extends GlobalSettingsState {
  const UpdateGlobalSettingsState({
    required super.globalMode,
    required super.lightMode,
    required super.darkMode,
    required super.primaryColor,
    required super.lang,
  });
}
