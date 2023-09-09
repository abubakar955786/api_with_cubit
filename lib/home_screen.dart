import 'package:api_with_cubit/cubit/api_cubit.dart';
import 'package:api_with_cubit/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    context.read<ApiCubit>().getResponse();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title:const Text("Api with cubit", style: TextStyle(color: Colors.white),),
      ),

      body: BlocConsumer<ApiCubit, ApiState>(
        listener: (context , state){
          print(state);
        },
          builder: (context, state){

          if(state is ApiDataLoading){
            return const Center( child:  CircularProgressIndicator(color: Colors.deepOrange,),);
          }else if(state is ApiError){
            return const Center(child: Text("Something went wrong"),);
          }else if(state is ApiDataEmpty){
            return const Center(child: Text("No data found."),);
          }else if(state is ApiDataLoaded){
            final apiResponse = state.model;
            return _apiData(apiResponse);
          }
          return const SizedBox();
    }, ),
    );
  }

  _apiData(Model apiResponse){
    return ListView.builder(
        itemCount: apiResponse.data!.length,
        itemBuilder: (context, index){
          final data = apiResponse.data![index];
          return ListTile(
            title: Text(data.name.toString()),
            subtitle:  Text(data.year.toString()),
          );
        });
  }
}
