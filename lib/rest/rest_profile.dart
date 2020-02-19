import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileApiService {
  final String baseUrl = "http://rest.katsini.com/api";
  http.Client client = http.Client();

  /**
   * Get /profile
   */
  Future<List<Profile>> getProfiles() async {
    final response = await client.get("$baseUrl/participants");
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      return profileFromJson(response.body);
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  /**
   * create
   */
  Future<bool> createProfile(Profile data) async {
    final response = await client.post(
      "$baseUrl/participants",
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  /**
   * Update
   */
  Future<bool> updateProfile(Profile data) async {
    final response = await client.put(
      "$baseUrl/participants/${data.id}",
      headers: {"content-type": "application/json"},
      body: profileToJson(data),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  /**
   * delete
   */
  Future<bool> deleteProfile(int id) async {
    final response = await client.delete(
      "$baseUrl/participants/$id",
      headers: {"content-type": "application/json"},
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}