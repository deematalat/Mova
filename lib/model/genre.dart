

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/constants.dart';
import '../widgets/custom_movies_button.dart';

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }

}

