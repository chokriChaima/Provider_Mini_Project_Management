import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomHydratedStorage implements Storage {
  SharedPreferences sharedPreferences;

  CustomHydratedStorage(this.sharedPreferences);

  @override
  Future<void> clear() async {
    await sharedPreferences.clear();
  }

  @override
  Future<void> close() async {}

  @override
  Future<void> delete(String key) async {
    await sharedPreferences.remove(key);
  }

  @override
  read(String key) => json.decode(sharedPreferences.getString(key)!);

  @override
  Future<void> write(String key, value) async =>
      await sharedPreferences.setString(key, json.encode(value));
}
