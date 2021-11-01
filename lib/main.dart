// ignore_for_file: always_specify_types

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/core/themes/app_theme.dart';
import 'package:gallery/data/repositories/photos.dart';
import 'package:gallery/data/repositories/sign_in.dart';
import 'package:gallery/data/repositories/sign_up.dart';
import 'package:gallery/data/services/photos.dart';
import 'package:gallery/data/services/sign_in.dart';
import 'package:gallery/data/services/sign_up.dart';
import 'package:gallery/logic/cubits/photos_cubit.dart';
import 'package:gallery/logic/cubits/sign_in_cubit.dart';
import 'package:gallery/logic/cubits/sign_up_cubit.dart';
import 'package:gallery/logic/cubits/validate_sign_in_cubit/validate_sign_in_cubit.dart';
import 'package:gallery/logic/cubits/validate_sign_up_cubit/validate_sign_up_cubit.dart';
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
    MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<ValidateSignUpCubit>(
          create: (BuildContext context) => ValidateSignUpCubit(),
        ),
        BlocProvider<ValidateSignInCubit>(
          create: (BuildContext context) => ValidateSignInCubit(),
        ),
        BlocProvider<SignInCubit>(
          create: (BuildContext context) => SignInCubit(
            SignInRepository(SignInService(httpClient)),
          ),
        ),
        BlocProvider<SignUpCubit>(
          create: (BuildContext context) => SignUpCubit(
            SignUpRepository(SignUpService(httpClient)),
          ),
        ),
        BlocProvider<PhotosCubit>(
          create: (BuildContext context) => PhotosCubit(
            PhotosRepository(PhotosService(httpClient)),
          ),
        ),
      ],
      child: GalleryApp(),
    ),
  );
}
