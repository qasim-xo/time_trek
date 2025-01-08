package com.example.project_management_app
   import androidx.annotation.NonNull
    import io.flutter.embedding.android.FlutterActivity
    import io.flutter.embedding.engine.FlutterEngine
    import io.flutter.plugin.common.MethodChannel


import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity()

override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    GeneratedPluginRegistrant.registerWith(flutterEngine!!);

    MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "android_app_retain").apply {
        setMethodCallHandler { method, result ->
            if (method.method == "sendToBackground") {
                moveTaskToBack(true)
            }
        }
    }
}
