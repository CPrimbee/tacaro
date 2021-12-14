import 'package:flutter/material.dart';

import 'package:tacaro/modules/create/repositories/create_repository.dart';
import 'package:tacaro/modules/login/repositories/login_repository.dart';
import 'package:tacaro/shared/models/user_model.dart';
import 'package:tacaro/shared/utils/app_state.dart';

class CreateController extends ChangeNotifier {
  final CreateRepository repository;
  AppState state = AppState.empty();
  final formKey = GlobalKey<FormState>();
  String _name = "";
  String _price = "";
  String _date = "";
  CreateController({required this.repository});

  void onChange({String? name, String? price, String? date}) {
    _name = name ?? _name;
    _price = price ?? _price;
    _date = date ?? _date;
  }

  bool validate() {
    final form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void update(AppState state) {
    this.state = state;
    notifyListeners();
  }

  Future<void> create() async {
    if (validate()) {
      try {
        update(AppState.loading());
        final response = await repository.create(
          name: _name,
          price: _price,
          date: _date,
        );
        if (response) {
          update(AppState.success<bool>(response));
        } else {
          throw Exception("Não foi possível cadastrar");
        }
      } on Exception catch (e) {
        update(AppState.error(
          e.toString(),
        ));
      }
    }
  }
}
