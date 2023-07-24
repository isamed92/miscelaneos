import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

//state notifier provider

class PermissionsNotifier extends StateNotifier<PermissionState> {
  PermissionsNotifier() : super(PermissionState()) {
    checkPermissions();
  }

  Future<void> checkPermissions() async {
    final permissionsList = await Future.wait([
      Permission.camera.status,
      Permission.photos.status,
      Permission.sensors.status,
      Permission.location.status,
      Permission.locationAlways.status,
      Permission.locationWhenInUse.status,
    ]);

    state = state.copyWith(
      camera: permissionsList[0],
      photoLibrary: permissionsList[1],
      sensors: permissionsList[2],
      location: permissionsList[3],
      locationAlways: permissionsList[4],
      locationWhenInUse: permissionsList[5],
    );
  }

  requestCameraAccess() async {
    final status = await Permission.camera.request();

    if (status.isGranted) {}
  }
}

class PermissionState {
  final PermissionStatus camera;
  final PermissionStatus photoLibrary;
  final PermissionStatus sensors;
  final PermissionStatus location;
  final PermissionStatus locationAlways;
  final PermissionStatus locationWhenInUse;

  PermissionState(
      {this.camera = PermissionStatus.denied,
      this.photoLibrary = PermissionStatus.denied,
      this.sensors = PermissionStatus.denied,
      this.location = PermissionStatus.denied,
      this.locationAlways = PermissionStatus.denied,
      this.locationWhenInUse = PermissionStatus.denied});

  get cameraGranted {
    return camera == PermissionStatus.granted;
  }

  get photoLibraryGranted {
    return photoLibrary == PermissionStatus.granted;
  }

  get sensorsGranted {
    return sensors == PermissionStatus.granted;
  }

  get locationGranted {
    return location == PermissionStatus.granted;
  }

  get locationAlwaysGranted {
    return locationAlways == PermissionStatus.granted;
  }

  get locationWhenInUseGranted {
    return locationWhenInUse == PermissionStatus.granted;
  }

  PermissionState copyWith({
    PermissionStatus? camera,
    PermissionStatus? photoLibrary,
    PermissionStatus? sensors,
    PermissionStatus? location,
    PermissionStatus? locationAlways,
    PermissionStatus? locationWhenInUse,
  }) =>
      PermissionState(
        camera: camera ?? this.camera,
        photoLibrary: photoLibrary ?? this.photoLibrary,
        sensors: sensors ?? this.sensors,
        location: location ?? this.location,
        locationAlways: locationAlways ?? this.locationAlways,
        locationWhenInUse: locationWhenInUse ?? this.locationWhenInUse,
      );
}
