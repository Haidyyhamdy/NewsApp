import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/cubit.dart';
import 'package:news_app/layout/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
leading: IconButton(
  icon: Icon(Icons.arrow_back_ios,),
  onPressed: (){
    Navigator.pop(context);
  },

),
            title:Text(
              'Search',
              style:TextStyle(
                color:Colors.blue,
                fontFamily: 'Cardo',
                fontStyle: FontStyle.italic,
              )
            ),
            iconTheme: IconThemeData(
              color: Theme.of(context).iconTheme.color,
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    controller: searchController,
                    change: (value) {
                      NewsCubit.get(context).getSearch(value);
                    },
                    type: TextInputType.text,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Search Must Not Empty';
                      }
                    },
                    label: 'search',
                    prefix: Icons.search,
                    context: context),
              ),
              Expanded(child: articleBuilder(list, context, isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
