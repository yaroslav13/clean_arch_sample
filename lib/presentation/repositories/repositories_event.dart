part of 'repositories_bloc.dart';

@immutable
abstract class RepositoriesEvent extends Equatable {
  const RepositoriesEvent();
}

@immutable
class RepositoriesInit extends RepositoriesEvent {
  const RepositoriesInit();

  @override
  List<Object?> get props => [];
}
