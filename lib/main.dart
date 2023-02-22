import 'package:flutter/material.dart';
import 'package:newchat/model/country.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'myapp.dart';

/// Initiates connection to Supabase.
void initSupabase() async{
  var url = 'https://kttzwdcfclugnhfytrtc.supabase.co';
  var anonkey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imt0dHp3ZGNmY2x1Z25oZnl0cnRjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU5OTgxNjMsImV4cCI6MTk5MTU3NDE2M30.0HIg2MGl2h_fvfDyYd5JkfvpgANHJ2gxF-sMUOBIKCI';
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: url,
    anonKey: anonkey,
  );
  debugPrint("database connected");
}

/// Tests that connections to Supabase are valid and tables can be loaded.
void testConnections() async{
  var country = CountryService().getSupabase(true);
  debugPrint("database loaded");
}

void main() async {
  initSupabase();
  testConnections();
  runApp(const MyApp());
  debugPrint("App loaded");
}

