library sign_in;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:gallery/core/api_query/sign_in.dart';
import 'package:gallery/core/constants/assets.dart';
import 'package:gallery/core/constants/colors.dart';
import 'package:gallery/core/constants/insets.dart';
import 'package:gallery/core/constants/localization.dart';
import 'package:gallery/core/constants/routes.dart';
import 'package:gallery/logic/cubits/request_cubit/request_cubit.dart';
import 'package:gallery/logic/cubits/sign_in_cubit.dart';
import 'package:gallery/logic/cubits/validate_sign_in_cubit/validate_sign_in_cubit.dart';

import '../../widgets/widgets_imports.dart';

part 'sign_in_screen.dart';
part 'widgets/form.dart';
