// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:wallet_monitor/storage/index.dart';

part 'global_settings_event.dart';
part 'global_settings_state.dart';

class GlobalSettingsBloc
    extends Bloc<GlobalSettingsEvent, GlobalSettingsState> {
  final SharedPreferences pref;

  GlobalSettingsBloc({required this.pref})
      : super(GlobalSettingsInitial(
          globalMode: pref.getString('globalMode') ?? 'system',
          lightMode: pref.getInt('lightMode') ?? 1,
          darkMode: pref.getInt('darkMode') ?? 1,
          primaryColor: pref.getInt('primaryColor') ?? 1,
          lang: pref.getString('lang') ?? 'und',
        )) {
    on<GlobalSettingsEvent>((event, emit) async {
      if (event is ChangeTheme) {
        print('cambiando el tema de la aplicacion');
        print(event.globalMode);
        print(event.lightMode);
        print(event.darkMode);
        await pref.setString('globalMode', event.globalMode);
        await pref.setInt('lightMode', event.lightMode);
        await pref.setInt('darkMode', event.darkMode);

        emit(UpdateGlobalSettingsState(
          globalMode: event.globalMode,
          lightMode: event.lightMode,
          darkMode: event.darkMode,
          primaryColor: pref.getInt('primaryColor') ?? 1,
          lang: pref.getString('lang') ?? 'und',
        ));
      }

      if (event is ChangePrimaryColor) {
        await pref.setInt('primaryColor', event.primaryColor);

        emit(UpdateGlobalSettingsState(
          globalMode: pref.getString('globalMode') ?? 'system',
          lightMode: pref.getInt('lightMode') ?? 1,
          darkMode: pref.getInt('darkMode') ?? 1,
          primaryColor: event.primaryColor,
          lang: pref.getString('lang') ?? 'und',
        ));
      }

      if (event is ChangeLang) {
        await pref.setString('lang', event.lang);

        emit(UpdateGlobalSettingsState(
          globalMode: pref.getString('globalMode') ?? 'system',
          lightMode: pref.getInt('lightMode') ?? 1,
          darkMode: pref.getInt('darkMode') ?? 1,
          primaryColor: pref.getInt('primaryColor') ?? 1,
          lang: event.lang,
        ));
      }
    });
  }
}
