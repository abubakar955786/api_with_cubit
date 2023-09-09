import 'package:api_with_cubit/api_services/api_services.dart';
import 'package:api_with_cubit/models/model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  ApiCubit() : super(ApiInitial());


  getResponse()async{
    emit(ApiDataLoading());

   await ApiServices().getData().then((value){

     if(value!.data!.isEmpty){
       emit(ApiDataEmpty());
     }else{
       emit(ApiDataLoaded(value));
     }



   }).onError((error, stackTrace){
     print( error.toString());
     emit(ApiError(error.toString()));
   });
  }
}
