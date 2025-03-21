import 'package:aviatoruz/data/entity/meteo_model.dart';
import 'package:aviatoruz/data/repository/app_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sectionTopicProvider =
    ChangeNotifierProvider((ref) => SectionTopicController());

class SectionTopicController extends ChangeNotifier {
  bool isLoading = false;

  MeteoModel? meteoModel;
  Future<void> getMeteoInifo(String api) async {
    isLoading = true;
    final result = await AppRepositoryImpl().getMeteo(api);
    if (result != null) {
      meteoModel = result;
      isLoading = false;
    } else {
      meteoModel = null;
    }
    notifyListeners();
  }

  double scale = 1.0;

  void zoomIn() {
    scale += 0.1;
    notifyListeners();
  }

  void zoomOut() {
    if (scale > 0.1) scale -= 0.1;
    notifyListeners();
  }
}
