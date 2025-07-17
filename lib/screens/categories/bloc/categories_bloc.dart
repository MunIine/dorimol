import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dorimol/api/api.dart';
import 'package:dorimol/api/models/category.dart';
import 'package:equatable/equatable.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc({required this.apiClient}) : super(CategoriesInitial()) {
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

  final DorimolApiClient apiClient;
}
