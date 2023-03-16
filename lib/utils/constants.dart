import 'package:flutter/material.dart';
import 'package:movies_app_flutter/screens/home_screen.dart';
import 'package:sizer/sizer.dart';

final GlobalKey<HomeScreenState> kHomeScreenKey = GlobalKey();
// api url
const kThemoviedbURL = "https://api.themoviedb.org/3/movie";
const kThemovieDiscoverdbURL = "https://api.themoviedb.org/3/discover/movie";
const kThemoviedbSearchURL = "https://api.themoviedb.org/3/search/movie";
const kThemoviedbImageURL = "https://image.tmdb.org/t/p/w300";
// screen button text
const kHomeScreenButtonFirstText = "Populars";
const kHomeScreenButtonSecondText = "Coming Soon";
const kHomeScreenButtonThirdText = "Top Rated";
// screens title
const kHomeScreenTitleText = "Watch Now";
const kcongratulationsText="congratulations";
const ksubcongText='your account is ready to use.you will\nbe redirected to Home Page in a\nfew seconds..';
const kInterstTitleText="Choose Your Interest";
const kInterstSubText="Choose your interests and get the best\nmovie recommendations.Don\'t worry,you\n can always change it later";
const k404Text = "Movies not found";
const kFavoriteRemovedText = "Movie removed from Favorites";
const kFavoriteAddedText = "Movie added to Favorites";
const kStartedButton='Get Started';
const kIntroText='Let\'s you in';
const kDetailsScreenTitleText = "Overview";
const kStoryLineTitleText = "Storyline";
const konBordingScreenTitleText = "Welcome to Mova";
const kSplashScreenTitleText = "loading..";
const kFinderScreenTitleText = "Finder";
const kFavoriteScreenTitleText = "Favorites";
const kDrawerTitleFirstText = "THEME";
const kDrawerTitleSecondText = "ABOUT";
const kDrawerTitleThirdText = "DEPENDENCIES";
const kAppliedTheme = "Theme applied";
const kSlognText='The best movie streaming app of the century \n to make your days great!';
const kNotFoundErrorText = "Not found";
const kDrawerAboutDescText =
    "Hi, I am a practicing Flutter developer. You see currently my portfoliowork, which is based on the themoviedb API. If you want to see my future developments, follow me on GitHub (vellt).";
const kDrawerDependenciesDescText =
    "\t• sizer\n\t• flutter_spinkit\n\t• cached_network_image\n\t• fluttertoast\n\t• http\n\t• path_provider";
const kMainRedColor=Color(0xffE21221);
const kPrimaryColor = Color(0xFF101010);
const kLightGrey = Color(0xFF545454);
const kAppBarColor = Color(0xFF1C1C1C);
const kTextShadowColor = Color(0x4D000000);
const kBackgroundShadowColor = Color(0x4D161616);
const kDrawerLineColor = Color(0xFF707070);
const kInactiveButtonColor = Color(0xFF474747);
const kDrawerTextColor = Color(0xFFBEBEBE);
const kSubTitleCardBoxColor = Color(0xFF8E8E8E);
const kSearchAppBarColor = Color(0xFF161616);
final kTextShadow = [
  Shadow(offset: Offset(0, 0.1.h), blurRadius: 6.0.sp, color: kTextShadowColor),
];

final kBoxShadow = [
  BoxShadow(
    color: kPrimaryColor,
    spreadRadius: 5,
    blurRadius: 30.sp,
    offset: Offset(0, 3),
  ),
];

final kHomeScreenButtonTextStyle = TextStyle(
  fontSize: 14.sp,
  fontWeight: FontWeight.bold,
  shadows: kTextShadow,
);

final kBoldTitleTextStyle = TextStyle(
  fontSize: 12.sp,
  fontWeight: FontWeight.bold,
  shadows: kTextShadow,
);

final kTitleTextStyle = TextStyle(
  fontSize: 12.sp,
  shadows: kTextShadow,
);

final kDrawerDescTextStyle = TextStyle(
  fontSize: 14.sp,
  color: kDrawerTextColor,
  height: 0.19.h,
);

final kAppBarTitleTextStyle = TextStyle(
  fontSize: 28.sp,
  fontWeight: FontWeight.bold,
  shadows: kTextShadow,
);

final kSplashScreenTextStyle = TextStyle(
  fontSize: 12.0.sp,
  color: kLightGrey,
);

final kSubTitleCardBoxTextStyle = TextStyle(
  color: kSubTitleCardBoxColor,
  fontSize: 9.sp,
);

final kSmallAppBarTitleTextStyle = TextStyle(
  fontSize: 18.sp,
  fontWeight: FontWeight.bold,
);

final kSmallTitleTextStyle = TextStyle(fontSize: 18.sp);

final kTextFieldDecoration = InputDecoration(
  border: InputBorder.none,
  focusedBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  errorBorder: InputBorder.none,
  disabledBorder: InputBorder.none,
);

final kMovieAppBarTitleTextStyle = TextStyle(fontSize: 22.sp);

final kDetailScreenBoldTitle = TextStyle(
  fontSize: 20.sp,
  fontWeight: FontWeight.bold,
);
final kDetailScreenRegularTitle = TextStyle(
  fontSize: 20.sp,
);
final ksigninTitle = TextStyle(
  fontSize: 12.sp,
  color:Colors.white
);
