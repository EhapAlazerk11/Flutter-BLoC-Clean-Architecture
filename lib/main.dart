import 'package:bloc/bloc.dart';
import 'package:base_flutter/base/application.dart';
import 'package:base_flutter/config/bloc/bloc_observer.dart';
import 'package:base_flutter/config/dependency_injection/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'config/router/router.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  /**
   *call for all dependencies you need to use it all over the app you don't need to create the same object
   * more and more and also without using a global variable.
   */
  await registerDependencies();
  /**
   * initial all routes using go_route that navigating with Navigator 2.0 is easy and useful of deep link
   * and solve a lot of problem with Navigator 1.0.
   */
  AppRouter.setUrlPathStrategy();


  /**
   * runzoned function to make us path observer for the hole application
   * we can change any cubit from onChange of BlocObserver.
   */
  BlocOverrides.runZoned(
    () => runApp(
      const Application(),
    ),
    blocObserver: AppBlocObserver(),
  );
}
