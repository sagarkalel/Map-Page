import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:map_page/blocs/main_page_bloc/main_page_bloc.dart';
import 'package:map_page/pages/main_page/views/app_dropdown.dart';
import 'package:map_page/pages/main_page/views/app_text_field.dart';
import 'package:map_page/pages/main_page/views/display_image_widget.dart';
import 'package:map_page/pages/main_page/views/error_text_widget.dart';
import 'package:map_page/pages/main_page/views/image_button.dart';
import 'package:map_page/pages/map_page/map_page.dart';
import 'package:map_page/utils/constants.dart';
import 'package:map_page/utils/widget_extensions.dart';

import 'views/title_widget.dart';

part 'views/main_page_view.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainPageBloc(),
      child: const MainPageView(),
    );
  }
}
