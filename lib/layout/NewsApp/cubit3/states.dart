 abstract class NewsStates {}
 class IntialState extends NewsStates {}
 class ChangeBottomBarIcon extends NewsStates {}
 class NewsGetdataLoading  extends NewsStates {}
 class NewsGetdataBusniessSuccess  extends NewsStates {}
 class NewsGetdataBusniessError  extends NewsStates {
 final String? erorr;

 NewsGetdataBusniessError(this.erorr);
}

 class NewsSportsGetdataLoading  extends NewsStates {}
 class NewsSportsGetdataBusniessSuccess  extends NewsStates {}
 class NewsSportsGetdataBusniessError  extends NewsStates {
  final String? erorr;

  NewsSportsGetdataBusniessError(this.erorr);
 }


 class NewsScienceGetdataLoading  extends NewsStates {}
 class NewsScienceGetdataBusniessSuccess  extends NewsStates {}
 class NewsScienceGetdataBusniessError  extends NewsStates {
  final String? erorr;

  NewsScienceGetdataBusniessError(this.erorr);
 }


 class NewsSearchGetdataLoading  extends NewsStates {}
 class NewsSearchGetdataSuccess  extends NewsStates {}
 class NewsSearchGetdataError  extends NewsStates {
  final String? erorr;

  NewsSearchGetdataError(this.erorr);
 }