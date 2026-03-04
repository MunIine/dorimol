part of 'account_bloc.dart';

sealed class AccountEvent extends Equatable {
  const AccountEvent();

  @override
  List<Object> get props => [];
}

class FetchAccountInfo extends AccountEvent {
  const FetchAccountInfo();

  @override
  List<Object> get props => [];
}

class ToggleEditMode extends AccountEvent {
  const ToggleEditMode();

  @override
  List<Object> get props => [];
}

class UpdateAccountBio extends AccountEvent {
  const UpdateAccountBio({
    required this.name,
    this.city,
    this.address,
  });

  final String name;
  final String? city;
  final String? address;

  @override
  List<Object> get props => [name, city ?? '', address ?? ''];
}