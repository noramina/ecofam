//MODEL
class Forum {
  final String image;
  final String nama;
  final String category;
  final String description;
  final String imgpost;
  final String date;
  final int likescount;
  final int commentcount;

  Forum({
    required this.image,
    required this.nama,
    required this.category,
    required this.description,
    required this.date,
    required this.imgpost,
    required this.likescount,
    required this.commentcount,
  });
}

final List<Forum> forumdata = [
  Forum(
      image:
          'https://i.pinimg.com/736x/c1/a2/66/c1a266d29b034774849dca740173e1aa.jpg',
      nama: 'Monggonoto',
      category: 'Pregnancy',
      description: 'Bagaimana caramu menghadapi Baby Blues',
      date: '15 August 2022 - 21.42',
      likescount: 3,
      imgpost: "",
      commentcount: 4),
  Forum(
      image:
          'https://i.pinimg.com/originals/85/66/a9/8566a940b96a067e4b85cf4f49d95973.jpg',
      nama: 'Vierra',
      category: 'Child Well Being',
      description: 'Bagaimana caramu membantu anakmu menyelesikan tugasnya?',
      date: '18 August 2022 - 08.42',
      likescount: 8,
      imgpost:
          "https://i.pinimg.com/736x/f8/ef/de/f8efde9337207d994fee20a26aecdc48.jpg",
      commentcount: 2),
  Forum(
      image:
          'https://i.pinimg.com/736x/c1/a2/66/c1a266d29b034774849dca740173e1aa.jpg',
      nama: 'Monggonoto',
      category: 'Child Well Being',
      description:
          'Bagaimana caramu untuk menghadapi mood seorang anak yang naik turun',
      date: '15 August 2022 - 21.42',
      likescount: 3,
      imgpost: "",
      commentcount: 4),
  Forum(
      image:
          'https://i.pinimg.com/736x/c1/a2/66/c1a266d29b034774849dca740173e1aa.jpg',
      nama: 'Monggonoto',
      category: 'Child Well Being',
      description:
          'Sebagai orang tua kita tidak boleh selalu menekan seorang anak sesuai dengan kemauan kita',
      date: '15 August 2022 - 21.42',
      likescount: 3,
      imgpost: "",
      commentcount: 4),
  Forum(
      image:
          'https://i.pinimg.com/originals/85/66/a9/8566a940b96a067e4b85cf4f49d95973.jpg',
      nama: 'Vierra',
      category: 'Pregnancy',
      description: 'Apakah ada yang pernah mengalami Baby Blues',
      date: '18 August 2022 - 08.42',
      likescount: 8,
      imgpost:
          "https://i.pinimg.com/736x/f8/ef/de/f8efde9337207d994fee20a26aecdc48.jpg",
      commentcount: 2),
];
