import 'package:advice_me/api/api.dart';
import 'package:advice_me/api/lib/core/network/dio_client.dart';
import 'package:advice_me/core/blocs/advice_list/advice_list_cubit.dart';
import 'package:advice_me/features/search/blocs/random_advice/random_advice_cubit.dart';
import 'package:advice_me/features/search/blocs/search_advice/search_advice_bloc.dart';
import 'package:advice_me/repositories/history/history.dart';
import 'package:advice_me/router/router.dart';
import 'package:advice_me/ui/theme/theme.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:translator/translator.dart';

late final Dio _dio;
late final RestClient apiClient;
late GoogleTranslator _translator;
late SharedPreferences _prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  setupDependencies();
  _prefs = await SharedPreferences.getInstance();
  runApp(const RhymerApp());
}

class RhymerApp extends StatefulWidget {
  const RhymerApp({super.key});

  @override
  State<RhymerApp> createState() => _RhymerAppState();
}

class _RhymerAppState extends State<RhymerApp> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchAdviceBloc>(
          create: (BuildContext context) =>
              SearchAdviceBloc(api: apiClient, translator: _translator),
        ),
        BlocProvider<AdviceListCubit>(
          create: (BuildContext context) => AdviceListCubit(
            historyRepository: HistoryRepository(prefs: _prefs),
          )..getHistoryAdvice(),
        ),
        BlocProvider<RandomAdviceCubit>(
          create: (BuildContext context) =>
              RandomAdviceCubit(api: apiClient, translator: _translator),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Advice Practice Application',
        theme: themeData,
        routerConfig: _router.config(),
      ),
    );
  }
}

void setupDependencies() {
  _dio = DioClient.create();

  apiClient = RestClient(
    _dio,
    baseUrl: dotenv.env['API_URL'] ?? 'https://api.adviceslip.com',
  );
  _translator = GoogleTranslator();
}
