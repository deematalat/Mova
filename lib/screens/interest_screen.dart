import 'package:flutter/material.dart';
import 'package:movies_app_flutter/screens/auth/profile_screen.dart';
import 'package:movies_app_flutter/utils/constants.dart';
import 'package:movies_app_flutter/utils/navi.dart'as navi;
import 'package:sizer/sizer.dart';
import '../model/genre.dart';
import '../services/movie.dart';
import '../widgets/skip_cont_buttons.dart';

class GenreListScreen extends StatefulWidget {
  @override
  _GenreListScreenState createState() => _GenreListScreenState();
}

class _GenreListScreenState extends State<GenreListScreen> {

  late Future<List<Genre>> _futureGenres;

  @override
  void initState() {
    super.initState();
    _futureGenres = getFetchGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.navigate_before, size: 30,),
        ),
        title:Text(kInterstTitleText),
      ),
      body: SingleChildScrollView(child: Padding(
        padding: EdgeInsets.all(16),
        child: FutureBuilder<List<Genre>>(
          future: _futureGenres,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return   Expanded(
                child: Column(
                  children: [
                    Text(kInterstSubText,style:kDrawerDescTextStyle.copyWith(
                      color: Colors.white
                    ) ,),
                    SizedBox(height:20.sp,),
                    Wrap(
                      spacing: 8.0,
                      runSpacing: 8.0,
                      children: snapshot.data!
                          .map((genre) =>Chip(
                        shape:RoundedRectangleBorder(
                            side: BorderSide(
                              color: kMainRedColor, // Change this to the color you want
                              width: 2.0, // Change this to the width you want
                            ),
                          borderRadius: BorderRadius.circular(30.0),
                        ),

                        backgroundColor:kPrimaryColor,
                          labelStyle:kDetailScreenRegularTitle.copyWith(
                            color:kMainRedColor
                          ),
                        label: Text(genre.name),
                      ))
                          .toList(),
                    ),
                    SizedBox(height:20.sp,),
                    SkipOrContinue(onPressed: () {
                       Navigator.pushAndRemoveUntil(context,MaterialPageRoute(
                           builder: (context)=>UserProfilePage()
                       )
                           , (route) => false);
                    },),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color:kMainRedColor,
                ),
              );
            }
          },
        ),
      ),
      ),
    );
  }

  Future<List<Genre>> getFetchGenres() async {
    final movieModel = MovieModel();
    List<Genre> genres = await movieModel.fetchGenres();
    return genres;
  }

}
