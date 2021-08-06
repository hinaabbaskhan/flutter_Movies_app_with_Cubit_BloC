class MovieModel {
   
  String? title;
  String? urlImage;
  String? release_date;

  MovieModel({
    required this.title,
    required this.urlImage,
    required this.release_date,
  });

MovieModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    urlImage = 'https://image.tmdb.org/t/p/w185${json['poster_path']}';
    release_date=json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['urlImage'] = this.urlImage;
    data['release_date']=this.release_date;
    return data;
  }
}