import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/news_cubit.dart';
import '../../cubit/news_states.dart';
import '../../shared/components.dart';

class ScienceScreen extends StatelessWidget {
  ScienceScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return cubit.scienceList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemBuilder: (context, index) => ListBuilder(
                      index, cubit.scienceList["articles"], context),
                  separatorBuilder: (context, index) => separator(),
                  itemCount: cubit.scienceList["articles"].length);
        });
  }
}
