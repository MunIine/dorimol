part of 'account_bloc.dart';

sealed class AccountState extends Equatable {
  const AccountState();
  
  @override
  List<Object> get props => [];
}

final class AccountInitial extends AccountState {}

final class AccountLoading extends AccountState {}

final class AccountLoaded extends AccountState {
  const AccountLoaded({required this.user, this.editMode = false});

  final User user;
  final bool editMode;

  AccountLoaded copyWith({
    User? user,
    bool? editMode,
  }) {
    return AccountLoaded(
      user: user ?? this.user,
      editMode: editMode ?? this.editMode,
    );
  }

  @override
  List<Object> get props => [user, editMode];
}

final class AccountFailure extends AccountState {
  const AccountFailure({required this.error});

  final Exception error;

  @override
  List<Object> get props => [error];
}