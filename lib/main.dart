import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kajian_sunnah_hsi/src/config/themes/app_themes.dart';
import 'package:kajian_sunnah_hsi/src/features/home/presentation/bloc/post/remote/remote_post_bloc.dart';
import 'package:kajian_sunnah_hsi/src/features/home/presentation/bloc/post/remote/remote_post_event.dart';
import 'package:kajian_sunnah_hsi/src/features/home/presentation/pages/home/home.dart';
import 'package:kajian_sunnah_hsi/injection_container.dart';

Future<void> main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemotePostsBloc>(
      create: (BuildContext context) => sl()..add(const GetPosts()),
      child: MaterialApp(
        title: 'Kajian Sunnah HSI',
        theme: theme(),
        home: const Home(),
      ),
    );
  }
}
