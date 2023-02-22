import 'dart:convert';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:newchat/model/services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
//this is not used in the chatroom app but only added for testing connection to database
class Country
{
  final String name;
  Country(this.name);

  factory Country.fromJson(Map<String, dynamic> map)
  => Country(map['name']);
}

Future<List<Country>> getCountries() async {
  final supabase = Supabase.instance.client;
  var response = await supabase.from('countries').select();
  List<dynamic> jsonArray = jsonDecode(jsonEncode(response));
  List<Country> countries = jsonArray.map((e) =>
      Country.fromJson(e)).toList();
  return countries;
}

class CountryService extends Services {
  @override
  List getOffline() {
    // TODO: implement getOffline
    throw UnimplementedError();
  }

  @override
  Future<List> getSupabase(bool test) async {
    final supabase = Supabase.instance.client;
    final response = await supabase.from('countries').select();
    List<dynamic> jsonArray = jsonDecode(jsonEncode(response));
    List<Country> result = jsonArray.map((e) =>
        Country.fromJson(e)).toList();
    if (test == true) {
      for (var chatUser in result) {
        debugPrint(chatUser.name);
      }
    }
    return result;
  }
}