part of 'repositories_bloc.dart';

@immutable
class RepositoriesState extends Equatable {
  const RepositoriesState({
    this.repositories,
    this.isLoading = false,
    this.error,
  });

  final List<Repository>? repositories;
  final bool isLoading;
  final String? error;

  RepositoriesState copyWith({
    List<Repository>? repositories,
    bool? isLoading,
    String? error,
  }) {
    return RepositoriesState(
      repositories: repositories ?? this.repositories,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [
        repositories,
        isLoading,
        error,
      ];
}
