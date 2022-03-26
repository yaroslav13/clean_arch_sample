import 'package:clean_arch_sample/domain/entities/repository.dart';
import 'package:clean_arch_sample/presentation/base/base_widget.dart';
import 'package:clean_arch_sample/presentation/repositories/repositories_bloc.dart';
import 'package:clean_arch_sample/presentation/repositories/widgets/repository_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
class RepositoriesScreen
    extends BaseWidget<RepositoriesBloc, RepositoriesEvent, RepositoriesState> {
  const RepositoriesScreen({Key? key}) : super(key: key);

  @override
  void onInit(RepositoriesBloc bloc) {
    bloc.add(const RepositoriesInit());
  }

  @override
  Widget buildBody() {
    return const Scaffold(
      body: _Body(),
    );
  }

  @override
  RepositoriesBloc get bloc => RepositoriesBloc();
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RepositoriesBloc, RepositoriesState>(
      builder: (context, state) {
        final error = state.error;

        if (error != null) {
          return _ErrorDispatcher(errorMessage: error);
        } else if (state.isLoading) {
          return const _CenteredLoader();
        } else {
          final repositories = state.repositories;

          if (repositories == null) {
            return const SizedBox();
          }

          return _RepositoriesListView(
            repositories: repositories,
          );
        }
      },
    );
  }
}

class _RepositoriesListView extends StatelessWidget {
  const _RepositoriesListView({
    required this.repositories,
    Key? key,
  }) : super(key: key);

  final List<Repository> repositories;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: repositories.length,
      itemBuilder: (context, index) {
        return RepositoriesListTile(
          repository: repositories[index],
        );
      },
    );
  }
}

@immutable
class _CenteredLoader extends StatelessWidget {
  const _CenteredLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

@immutable
class _ErrorDispatcher extends StatelessWidget {
  const _ErrorDispatcher({
    required this.errorMessage,
    Key? key,
  }) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage),
    );
  }
}
