import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@immutable
abstract class BaseWidget<B extends Bloc<E, S>, E, S> extends StatelessWidget {
  const BaseWidget({Key? key}) : super(key: key);

  void onInit(B bloc);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<B>(
      create: (_) {
        final blocInstance = bloc;

        onInit(blocInstance);

        return blocInstance;
      },
      child: buildBody(),
    );
  }

  B get bloc;

  Widget buildBody();
}
