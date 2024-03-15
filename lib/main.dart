import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testproject/authontications_screens/login_screen.dart';
import 'package:testproject/core/api/dio_consumer.dart';
import 'package:testproject/cubit/user_cubit.dart';
import 'package:testproject/register_screen.dart';






void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserCubit(DioConsummer(dio: Dio())),
          ),
        ],
        child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
      return
        MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginScreen()
        );
    })
    );
  }
}


