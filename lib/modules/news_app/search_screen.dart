import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_sdk/cubit/news_cubit.dart';
import 'package:news_app_new_sdk/cubit/news_states.dart';
import 'package:news_app_new_sdk/shared/components.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    cubit.chageTheme();
                  },
                  icon: Icon(Icons.brightness_4_outlined))
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: cubit.search,
                        keyboardType: TextInputType.text,
                        validator: (String? val) {
                          if (val!.isEmpty) {
                            return "Keyword can't be empty";
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          labelText: "Search",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          color: cubit.isLight
                              ? Colors.deepOrange
                              : Colors.deepPurple,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: TextButton(
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              cubit.changeSearchList(cubit.search.text);
                            }
                          },
                          child: Center(
                            child: Text(
                              "Search",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  child: cubit.searchList.isEmpty
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.separated(
                          itemBuilder: (context, index) => ListBuilder(
                              index, cubit.searchList["articles"], context),
                          separatorBuilder: (context, index) => separator(),
                          itemCount: cubit.searchList["articles"].length))
            ],
          ),
        );
      },
    );
  }
}
