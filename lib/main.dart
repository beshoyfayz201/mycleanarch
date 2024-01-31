import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/domain/entity/book_entity.dart';
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
  await Hive.openBox<BookEntity>(AppConsts.faturedHiveBox)
    ..clear();
  await Hive.openBox<BookEntity>(AppConsts.newestHiveBox)
    ..clear();

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
                FetchFeaturedBooksUseCase(homeRepo: getIt.get<HomeRepoImpl>()))
              ..fetchFeatured()),
        BlocProvider(
            create: (context) => NewestBooksCubit(
                FetchNewestUseCase(homeRepo: getIt.get<HomeRepoImpl>()))
              ..fetchNewest()),
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
