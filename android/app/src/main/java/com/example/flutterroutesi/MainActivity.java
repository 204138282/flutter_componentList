package com.example.flutterroutesi;

import android.os.Bundle;
import android.text.TextUtils;
import android.widget.Toast;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "com.flyou.test/android";
 
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        System.out.println(call.method);
                        if (call.method.equals("showToast")) {
                            if (call.hasArgument("msg") && !TextUtils.isEmpty(call.argument("msg").toString())) {
                                Toast.makeText(MainActivity.this, call.argument("msg").toString(), Toast.LENGTH_SHORT).show();
                            } else {
                                Toast.makeText(MainActivity.this, "toast text must not null", Toast.LENGTH_SHORT).show();
                            }
                        } 
                        else if (call.method.equals("getAndroidTime")) {
                            result.success(getCurrentTime());
                        }
                    }
                });
  
	private String getCurrentTime(){
        return  new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(System.currentTimeMillis());
	}
