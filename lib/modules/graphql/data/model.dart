class Post {
  final String title;
  final String description;
  final String image;

  Post({
    required this.title,
    required this.description,
    required this.image,
  });

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      title: map['title'] as String,
      description: map['excerpt'] as String,
      image: map['coverImage']['url'] as String,
    );
  }
}
