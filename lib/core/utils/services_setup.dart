import 'package:bookly/Features/home/data/data_source/local/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_source/remote/home_remote_data_source.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/core/utils/api_services/api_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(homeRemoteDataSource: HomeRemoteDataSourceImpl(apiServices: ApiServices()), homeLocalDataSource: HomeLocalDataSourceImp()));
}
