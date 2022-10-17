
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/NewsApp/cubit3/cubit.dart';
import '../../../layout/NewsApp/cubit3/states.dart';
import '../../../shared/component/componanets.dart';



class Sport extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context , state){},
      builder: (context , state)
      {
        var list = NewsCubit.get(context).sports;

           if(list.length>0)
            return  ListView.separated(
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
            );

          else
            return Center(child: CircularProgressIndicator());



      },

    );

  }
}
