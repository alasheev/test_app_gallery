import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_gallery/di.dart';
import 'package:test_app_gallery/features/photo/presentation/bloc/get_new/get_new_cubit.dart';
import 'package:test_app_gallery/features/photo/presentation/bloc/get_popular/get_popular_cubit.dart';
import 'package:test_app_gallery/pages/main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => sl<GetNewPhotosCubit>()),
          BlocProvider(create: (_) => sl<GetPopularPhotosCubit>()),
        ],
        child: const MainPage(),
      ),
    );
  }
}
