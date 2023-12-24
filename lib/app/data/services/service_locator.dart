import 'package:get_it/get_it.dart';

import '../repositories_impl/hands_repository_impl.dart';
import 'model_inference_service.dart';

final locator = GetIt.instance;

void setupLocator() {
/*   locator.registerSingleton<FaceDetection>(FaceDetection());
  locator.registerSingleton<FaceMesh>(FaceMesh()); */
  locator.registerSingleton<Hands>(Hands());
  /* locator.registerSingleton<Pose>(Pose()); */

  locator.registerLazySingleton<ModelInferenceService>(
      () => ModelInferenceService());
}
