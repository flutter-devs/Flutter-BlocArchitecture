import 'package:flutter_bloc_architecture/src/services/api_response.dart';
import 'package:flutter/material.dart';

typedef ApiValueWidget = Widget Function(String message);
typedef ApiDataWidget<T> = Widget Function(T value);

class ApiStreamBuilder<T> extends StatelessWidget {
  final Stream stream;
  final ApiDataWidget<T> dataWidget;
  final ApiValueWidget loadingWidget;
  final ApiValueWidget errorWidget;

  ApiStreamBuilder(
      {@required this.stream,
      @required this.dataWidget,
      @required this.loadingWidget,
      @required this.errorWidget});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ApiResponse<T>>(
      stream: stream,
      builder: (context, AsyncSnapshot<ApiResponse<T>> snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data.status) {
            case Status.LOADING:
              return loadingWidget(snapshot.data.message);
              break;
            case Status.COMPLETED:
              return dataWidget(snapshot.data.data);
              break;
            case Status.ERROR:
              return errorWidget(snapshot.data.message);
              break;
          }
        }
        return Container();
      },
    );
  }
}
