
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/NewsApp/cubit3/cubit.dart';
import '../../../layout/NewsApp/cubit3/states.dart';
import '../../../shared/component/componanets.dart';



class NewsSearch extends StatelessWidget {
  
var searchtextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context , state){},
      builder: (context , state)
      {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: defaultTextForm(
                    textEditingController: searchtextEditingController,
                    type: TextInputType.text,
                    onsubmit: (value){},
                    onchanged: (value){
                      NewsCubit.get(context).getSearch(value);
                    } ,
                    text: 'Search',
                    prefix:Icons.search ,
                    validate: (String ? value)
                    {
                      if(value!.isEmpty)
                        return "Search must not be empty";
                      return null;
                    }
                ),
              ),


                   if(list.length>0)

                     Expanded(
                       child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index)
                          {
                            return BuildArticleItem(list[index],context);
                          },
                          separatorBuilder: (context, index)
                          {
                            return Container(
                              width: double.infinity,
                              color: Colors.grey,
                            );
                          },
                          itemCount: 10
                    ),
                     )
                  else

                    Expanded(child: Container())




            ],
          ),
        );
      },


    );
  }
}
