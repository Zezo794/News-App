


import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/News_App/News_search/News_search.dart';
import '../../shared/todocubit/cubit.dart';
import 'cubit3/cubit.dart';
import 'cubit3/states.dart';



class  NewsApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state)
      {

      },
      builder: (context , state)
      {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("News app"),
            actions: [
              IconButton(onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context){
                  return NewsSearch();
                }));
              }, icon: Icon(Icons.search)),
              IconButton(onPressed: (){
                AppCubit.get(context).changedarkmode();
              }, icon: Icon(Icons.brightness_4))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items:cubit.bottomitem ,
            currentIndex: cubit.currentindex,
            onTap: (index)
            {
                  cubit.changeBottomBarIcon(index);
            },
          ),
          body: cubit.screens[cubit.currentindex],




        );
      },

    );
  }
}
