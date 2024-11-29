import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_mockup/api/model/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    _fetchProductDetails();
  }
  _fetchProductDetails() {
    return on<ProductFetchEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        Dio dio = Dio();

        Response response = await dio.get(
          "https://oriflamenepal.com/api/product/for-public/smart-sync-lipstick-233",
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        );

        print(response.statusCode);
        print(response.data);
        if (response.statusCode == 200) {
          emit(ProductCompletedState(
              productData: ProductData.fromJson(response.data['data'])));

          return response.data;
        } else {
          emit(ProductErrorState(message: response.statusMessage.toString()));
        }
      } on DioException catch (e) {
        emit(ProductErrorState(message: e.response!.statusMessage.toString()));
      }
    });
  }
}
