import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dorimol/api/public_api_client.dart';
import 'package:dorimol/models/category.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<FetchCategories>((event, emit) async {
      try {
        emit(CategoriesLoading());
        final categories = await apiClient.fetchCategories();
        emit(CategoriesLoaded(categories));
      } on Exception catch (e) {
        emit(CategoriesFailure(e));
      }
    });
  }

  final PublicApiClient apiClient = GetIt.I<PublicApiClient>();
}
