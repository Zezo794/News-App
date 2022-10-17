

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/shared/todocubit/states.dart';
import 'package:sqflite/sqflite.dart';


import 'package:path/path.dart';

import '../network/local/Cash_helper.dart';



class AppCubit extends Cubit<AppState>
{
  AppCubit(): super(IntialAppState());
  static AppCubit get(context)
  {
    return BlocProvider.of(context);
  }



  bool isdark = false;
  void changedarkmode({bool ?fromshared})
  {
    if(fromshared!=null) {
      isdark = fromshared;
      emit(ChangeDarkness());
    }
    else
      {
    isdark=!isdark;
    CashHelper.putbool(key: 'isDark', value: isdark).then((value) {
      emit(ChangeDarkness());
    });

    }
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaa${fromshared}');
  }
}