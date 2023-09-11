import 'package:flutter/material.dart';

/// ============================== colors ==============================
const KPrimaryColor=Color(0xff6f35a5);
const KPrimaryLightColor=Color(0xfff1e6ff);
const kTextColor = Color(0xFF757575);
/// ============================== home_screen ==============================
const String avatar = 'Avatar';
const String action = 'Action';
const String sciFi = 'Sci-Fi';
const String adventure = 'Adventure';
const String votes = '8.7/10 139k votes';
const String watchTrailer = 'Watch Trailer';

/// ============================== detail_screen ==============================
const String aboutTheMovie = 'About the Movie';
const String cast = 'Cast';
const String crew = 'Crew';
const String reviews = 'Reviews';
const String recommendedMovies = 'Recommend Movies';

/// ============================== Constant ==============================
class Content {
  final String title;

  Content(this.title);
}

List<Content> contents = [
  Content('Avatar'),
  Content('Black Panther'),
  Content('Varisu'),
  Content('Black Adam'),
];