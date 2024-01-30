import 'package:bookly/Features/home/domain/entity/book_entity.dart';
import 'package:bookly/Features/home/domain/repos/home_repo.dart';
import 'package:bookly/Features/home/domain/usecases/fatch_newest_use_case.dart';
import 'package:bookly/Features/home/domain/usecases/fetch_featured_books_use_case.dart';
import 'package:bookly/Features/home/presentation/control/fetured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/control/newest_book_cubit/newest_books_cubit_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/functions/simple_block_observer.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/appconsts.dart';
import 'package:bookly/core/utils/services_setup.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  setupServiceLocator();

  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox(AppConsts.faturedHiveBox);
  await Hive.openBox(AppConsts.newestHiveBox);
  Bloc.observer = SimpleBlockObserver();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(
                FetchFeaturedBooksUseCase(homeRepo: getIt.get<HomeRepo>()))),
        BlocProvider(
            create: (context) => NewestBooksCubit(
                FetchNewestUseCase(homeRepo: getIt.get<HomeRepo>()))),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
