import 'package:get_it/get_it.dart';

import '../view_models/form_field_viewmodel.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<FormFieldViewModel>(() => FormFieldViewModel());
}
