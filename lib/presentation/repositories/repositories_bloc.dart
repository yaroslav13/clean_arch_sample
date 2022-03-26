import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_arch_sample/domain/entities/repository.dart';
import 'package:clean_arch_sample/domain/interactors/get_repositories_interactor.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'repositories_event.dart';
part 'repositories_state.dart';

class RepositoriesBloc extends Bloc<RepositoriesEvent, RepositoriesState> {
  RepositoriesBloc()
      : _getRepositoriesInteractor = GetRepositoriesInteractor(),
        super(const RepositoriesState()) {
    on<RepositoriesEvent>(_onRepositoriesEvent);
  }

  final GetRepositoriesInteractor _getRepositoriesInteractor;

  Future<void> _onRepositoriesEvent(
    RepositoriesEvent event,
    Emitter<RepositoriesState> emit,
  ) async {
    if (event is RepositoriesInit) {
      await _fetchRepositories(emit);
    }
  }

  Future<void> _fetchRepositories(
    Emitter<RepositoriesState> emit,
  ) async {
    try {
      emit(state.copyWith(
        isLoading: true,
      ));

      final repositories = await _getRepositoriesInteractor();

      emit(state.copyWith(
        repositories: repositories,
      ));
    } on Exception catch (e, s) {
      emit(state.copyWith(
        error: e.toString(),
      ));
    } finally {
      emit(state.copyWith(
        isLoading: false,
      ));
    }
  }
}
