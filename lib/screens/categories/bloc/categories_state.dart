part of 'categories_bloc.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();
  
  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesLoaded extends CategoriesState {
  const CategoriesLoaded(this.categories);

  final List<Category> categories;

  @override
  List<Object> get props => super.props..addAll(categories);
}

final class CategoriesFailure extends CategoriesState {
  const CategoriesFailure(this.error);

  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}