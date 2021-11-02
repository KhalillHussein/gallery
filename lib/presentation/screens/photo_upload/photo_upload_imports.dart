library photo_upload;

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gallery/core/api_query/photo_upload.dart';
import 'package:gallery/core/constants/assets.dart';
import 'package:gallery/core/constants/insets.dart';
import 'package:gallery/core/constants/localization.dart';
import 'package:gallery/logic/cubits/upload_photo_cubit.dart';
import 'package:gallery/presentation/widgets/widgets_imports.dart';
import 'package:image_picker/image_picker.dart';
import 'package:styled_widget/styled_widget.dart';

part 'photo_upload_screen.dart';
part 'widgets/bottom_bar.dart';
