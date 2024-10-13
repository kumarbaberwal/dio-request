import 'package:dioreq/common/bloc/display_data_state.dart';
import 'package:dioreq/core/usecase/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dartz/dartz.dart';

class DisplayDataCubit<T> extends Cubit<DisplayDataState> {
  DisplayDataCubit() : super(DataLoading());

  void getData(Usecase<T, dynamic> usecase, {dynamic params}) async {
    emit(DataLoading());
    final Either<String, T> returnedData = await usecase.call(params: params);
    returnedData.fold(
      (error) => emit(DataLoadFailure(errorMessage: error)),
      (data) => emit(DataLoaded<T>(data: data)),
    );
  }
}
