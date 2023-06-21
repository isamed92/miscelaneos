import 'package:flutter/material.dart' show AppLifecycleState;
import 'package:flutter_riverpod/flutter_riverpod.dart';
/* 
      AppLifecycleState.inactive - cuando se abre otra app, cuando una app ya no esta en foco
      AppLifecycleState.paused - cuando la app esta en segundo plano
      AppLifecycleState.resumed - paso de estar en segundo plano a primer plano
      AppLifecycleState.detached - cuando la app se cierra
    */

final appStateProvider = StateProvider<AppLifecycleState>((ref) {
  return AppLifecycleState.resumed;
});
