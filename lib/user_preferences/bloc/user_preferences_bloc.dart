import 'dart:async';

import 'package:first_week_demo/user_preferences/bloc/user_preferences_event.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserPreferencesBloc
    extends HydratedBloc<UserPreferencesEvent, ThemeMode> {

  UserPreferencesBloc() : super(ThemeMode.system) {
    on<UserPreferencesDarkThemeEnabled>(mapDarkThemeEnabledToState);
    on<UserPreferencesLightThemeEnabled>(mapLightThemeEnabledToState);
  }

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    try {
      if (json['themeMode'] == ThemeMode.light.name) {
        return ThemeMode.light;
      } else if (json['themeMode'] == ThemeMode.dark.name) {
        return ThemeMode.dark;
      } else {
        return ThemeMode.system;
      }
    } catch (_) {
      return null;
    }
  }



  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    try {
      return {'themeMode': state.name};
    } catch (_) {
      return null;
    }
  }

  Future<void> mapDarkThemeEnabledToState(UserPreferencesDarkThemeEnabled event,
          Emitter<ThemeMode> emit) async =>
    emit(ThemeMode.dark);



  Future<void> mapLightThemeEnabledToState(
          UserPreferencesLightThemeEnabled event,
          Emitter<ThemeMode> emit) async =>
      emit(ThemeMode.light);
}
