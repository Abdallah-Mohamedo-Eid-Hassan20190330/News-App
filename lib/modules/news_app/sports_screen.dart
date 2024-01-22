import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/news_cubit.dart';
import '../../cubit/news_states.dart';
import '../../shared/components.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return cubit.sportsList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemBuilder: (context, index) =>
                      ListBuilder(index, cubit.sportsList["articles"], context),
                  separatorBuilder: (context, index) => separator(),
                  itemCount: cubit.sportsList["articles"].length);
        });
  }
}
