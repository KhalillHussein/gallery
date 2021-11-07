library widgets;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gallery/core/constants/assets.dart';
import 'package:gallery/core/constants/colors.dart';
import 'package:gallery/core/constants/insets.dart';
import 'package:gallery/core/constants/localization.dart';
import 'package:gallery/core/constants/routes.dart';
import 'package:gallery/data/models/photo.dart';
import 'package:gallery/logic/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:gallery/logic/cubits/pagination_cubit/pagination_cubit.dart';
import 'package:gallery/logic/cubits/photos_filter_cubit/photos_filter_cubit.dart';
import 'package:gallery/logic/cubits/photos_pagination_cubit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../core/constants/insets.dart';

part 'cupertino_app_bar.dart';
part 'login_field.dart';
part 'login_title.dart';
part 'text_button.dart';
part 'error.dart';
part 'loading.dart';
part 'avatar.dart';
part 'photos_grid.dart';
