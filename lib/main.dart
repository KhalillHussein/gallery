// ignore_for_file: always_specify_types

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/core/themes/app_theme.dart';
import 'package:gallery/presentation/app.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:path_provider/path_provider.dart';

import 'logic/debug/app_bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getTemporaryDirectory(),
  );
  final httpClient = Dio();
  AppTheme.setStatusBarColor();
  runApp(
    GalleryApp(),
    // MultiBlocProvider(
    //   providers: <BlocProvider>[
    //     BlocProvider<AuthCubit>(
    //       create: (BuildContext context) => AuthCubit(
    //         AuthRepository(AuthService(httpClient)),
    //       ),
    //     ),
    //     BlocProvider<TransactionsCubit>(
    //       create: (BuildContext context) => TransactionsCubit(
    //         TransactionsRepository(TransactionsService(httpClient)),
    //       ),
    //     ),
    //   ],
    //   child: TransactionsApp(),
    // ),
  );
}
