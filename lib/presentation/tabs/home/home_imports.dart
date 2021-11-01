library home;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallery/core/api_query/photos.dart';
import 'package:gallery/core/constants/colors.dart';
import 'package:gallery/core/constants/insets.dart';
import 'package:gallery/core/constants/localization.dart';
import 'package:gallery/core/constants/routes.dart';
import 'package:gallery/data/models/photo.dart';
import 'package:gallery/logic/cubits/photos_cubit.dart';
import 'package:gallery/logic/cubits/request_cubit/request_cubit.dart';
import 'package:gallery/presentation/widgets/widgets_imports.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:styled_widget/styled_widget.dart';

part 'home_tab.dart';
part 'widgets/photos_grid.dart';
part 'widgets/search_bar.dart';
part 'widgets/tabs.dart';
