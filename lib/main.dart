// ignore_for_file: always_specify_types

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/core/themes/app_theme.dart';
import 'package:gallery/data/repositories/sign_up.dart';
import 'package:gallery/data/services/sign_up.dart';
import 'package:gallery/logic/cubit/sign_up_cubit.dart';
import 'package:gallery/logic/cubit/validate_cubit.dart';
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
  //TODO: REFACTOR THAT
  runApp(
    MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<ValidateCubit>(
          create: (BuildContext context) => ValidateCubit(),
        ),
        BlocProvider<SignUpCubit>(
          create: (BuildContext context) => SignUpCubit(
            SignUpRepository(SignUpService(httpClient)),
          ),
        ),
      ],
      child: GalleryApp(),
    ),
  );
}
