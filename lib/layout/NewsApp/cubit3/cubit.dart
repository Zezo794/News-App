import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/layout/NewsApp/cubit3/states.dart';

import '../../../modules/News_App/Science_Screen/Science_Screen.dart';
import '../../../modules/News_App/Sport_Screen/Sport_Screen.dart';
import '../../../modules/News_App/busniess_Screen/busniess_Screen.dart';
import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit(): super(IntialState());
  static NewsCubit get(context)
  {
    return BlocProvider.of(context);
  }
  var currentindex=0;
  List<BottomNavigationBarItem> bottomitem =
      [
        BottomNavigationBarItem(icon: Icon(Icons.business) , label: "business"),
        BottomNavigationBarItem(icon: Icon(Icons.sports) , label: "sports"),
        BottomNavigationBarItem(icon: Icon(Icons.science) , label: "science"),

      ];

  void changeBottomBarIcon(int index)

  {
    currentindex=index;
    emit(ChangeBottomBarIcon());
  }
  List<Widget> screens =
      [
        Busniess(),
        Sport(),
        Scinece(),

      ];
  List<dynamic> busniess = [];
  void getBusniess()
  {
    emit(NewsGetdataLoading());
    Diohelper.getdata(url: 'v2/top-headlines', query:
    {
      'country': 'eg',
      'category' : 'business',
      'apiKey' : '46bc5e0eccc941c99ca85c24563fbd86'
    }
    ).then((value) {
     // print(value.data['articles'][0]['title']);
      busniess=value.data['articles'];
      print(busniess[0]['title']);
      emit(NewsGetdataBusniessSuccess());
    }).catchError((erorr)
    {
      print(erorr.toString());
      emit(NewsGetdataBusniessError(erorr.toString()));
    });
  }

  List<dynamic> sports = [];
  void getSprts()
  {
    emit(NewsSportsGetdataLoading());
    Diohelper.getdata(url: 'v2/top-headlines', query:
    {
      'country': 'eg',
      'category' : 'sports',
      'apiKey' : '46bc5e0eccc941c99ca85c24563fbd86'
    }
    ).then((value) {
      // print(value.data['articles'][0]['title']);
      sports=value.data['articles'];
      print(sports[0]['title']);
      emit(NewsSportsGetdataBusniessSuccess());
    }).catchError((erorr)
    {
      print(erorr.toString());
      emit(NewsSportsGetdataBusniessError(erorr.toString()));
    });
  }

  List<dynamic> science = [];
  void getScience()
  {
    emit(NewsScienceGetdataLoading());
    Diohelper.getdata(url: 'v2/top-headlines', query:
    {
      'country': 'eg',
      'category' : 'science',
      'apiKey' : '46bc5e0eccc941c99ca85c24563fbd86'
    }
    ).then((value) {
      // print(value.data['articles'][0]['title']);
      science=value.data['articles'];
      print(science[0]['title']);
      emit(NewsScienceGetdataBusniessSuccess());
    }).catchError((erorr)
    {
      print(erorr.toString());
      emit(NewsScienceGetdataBusniessError(erorr.toString()));
    });
  }
  List<dynamic> search =[];
  void getSearch( String ? value)
  {
    emit(NewsSearchGetdataLoading());
    Diohelper.getdata(url: 'v2/everything', query:
    {

      'q' : '${value}',
      'apiKey' : '46bc5e0eccc941c99ca85c24563fbd86'
    }
    ).then((value) {
      // print(value.data['articles'][0]['title']);
      search=value.data['articles'];
      print(search[0]['title']);
      emit(NewsSearchGetdataSuccess());
    }).catchError((erorr)
    {
      print(erorr.toString());
      emit(NewsSearchGetdataError(erorr.toString()));
    });
  }

}