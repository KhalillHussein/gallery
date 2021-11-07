// ignore_for_file: always_specify_types

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gallery/core/themes/app_theme.dart';
import 'package:gallery/data/repositories/repositories_import.dart';
import 'package:gallery/data/services/services_import.dart';
import 'package:gallery/logic/cubits/authentication_cubit/authentication_cubit.dart';

import 'package:gallery/logic/cubits/photos_cubit.dart';
import 'package:gallery/logic/cubits/photos_filter_cubit/photos_filter_cubit.dart';
import 'package:gallery/logic/cubits/photos_pagination_cubit.dart';
import 'package:gallery/logic/cubits/sign_in_cubit.dart';
import 'package:gallery/logic/cubits/sign_up_cubit.dart';
import 'package:gallery/logic/cubits/upload_photo_cubit.dart';
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
  final storage = FlutterSecureStorage();
  final httpClient = Dio()
    ..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
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
            SignInRepository(SignInService(httpClient), storage),
            ClientRepository(ClientService(httpClient)),
            CurrentUserRepository(CurrentUserService(httpClient)),
          ),
        ),
        BlocProvider<SignUpCubit>(
          create: (BuildContext context) => SignUpCubit(
            SignUpRepository(SignUpService(httpClient)),
          ),
        ),
        BlocProvider<AuthenticationCubit>(
          create: (BuildContext context) => AuthenticationCubit(
            signInCubit: context.read<SignInCubit>(),
            signUpCubit: context.read<SignUpCubit>(),
          ),
        ),
        BlocProvider<PhotosCubit>(
          create: (BuildContext context) => PhotosCubit(
            PhotosRepository(PhotosService(httpClient)),
          ),
        ),
        BlocProvider<PhotosFilterCubit>(
          create: (BuildContext context) => PhotosFilterCubit(
            context.read<PhotosCubit>(),
          ),
        ),
        BlocProvider<PhotosPaginationCubit>(
          create: (BuildContext context) => PhotosPaginationCubit(
            context.read<PhotosCubit>(),
            context.read<PhotosFilterCubit>(),
          ),
        ),
        BlocProvider<UploadPhotoCubit>(
          create: (BuildContext context) => UploadPhotoCubit(
              UploadPhotoRepository(UploadPhotoService(httpClient)),
              MediaObjectRepository(MediaObjectService(httpClient))),
        ),
      ],
      child: GalleryApp(),
    ),
  );
}
