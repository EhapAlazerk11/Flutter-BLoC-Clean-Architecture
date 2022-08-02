import 'package:base_flutter/base/constants/constant.dart';
import 'package:base_flutter/config/dependency_injection/dependency_injection.dart';
import 'package:base_flutter/features/favorite/application/favorite_cubit.dart';
import 'package:base_flutter/features/favorite/screen/favorite_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {

  static final GoRouter router = GoRouter(
    debugLogDiagnostics: kDebugMode,
    routes: [
      GoRoute(
          path: AppConstant.mainDir,
          pageBuilder: (context, state) =>
              MaterialPage(
                key: state.pageKey,
                child: BlocProvider(
                  create: (context) => getIt<FavoriteCubit>()..getFavoritesData(),
                  child: HomeProduct(),
                ),
              )
      )
    ],
    errorPageBuilder: (context, state) =>
        MaterialPage(
          key: state.pageKey,
          child: ErrorScreen(error: state.error),
        ),
    redirect: (state) {
      // if you want to check the state your in and change it to any case you want
    },
  );

  const AppRouter._();

  static void setUrlPathStrategy() {
    GoRouter.setUrlPathStrategy(UrlPathStrategy.path);
  }
}

class ErrorScreen extends StatelessWidget {
  final Exception? error;

  const ErrorScreen({Key? key, this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const CloseButton()),
      body: const Center(
        child: Text('Something went wrong!'),
      ),
    );
  }
}
