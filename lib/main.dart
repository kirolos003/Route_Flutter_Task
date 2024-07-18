import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_route_task/Features/products_catalog/presentation/cubit/catalogViewModel.dart';
import 'package:flutter_route_task/Features/products_catalog/presentation/pages/catalog_screen.dart';
import 'package:flutter_route_task/di/di.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: BlocProvider(
          create: (context) => getIt<CatalogScreenViewModel>(),
          child: CatalogScreen(),
        ),
      ),
    );
  }
}
