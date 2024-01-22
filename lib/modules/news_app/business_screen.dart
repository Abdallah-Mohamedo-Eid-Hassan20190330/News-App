import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_sdk/cubit/news_cubit.dart';
import 'package:news_app_new_sdk/cubit/news_states.dart';

import '../../shared/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit cubit = NewsCubit.get(context);
          return cubit.businessList.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemBuilder: (context, index) => ListBuilder(
                      index, cubit.businessList["articles"], context),
                  separatorBuilder: (context, index) => separator(),
                  itemCount: cubit.businessList["articles"].length);
        });
  }
}
