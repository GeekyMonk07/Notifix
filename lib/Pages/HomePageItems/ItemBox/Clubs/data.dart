class Clubs {
  final int position;
  final String name;
  final String iconImage;
  final String description;
  final List<String> images;

  Clubs(
    this.position, {
    required this.name,
    required this.iconImage,
    required this.description,
    required this.images,
  });
}

List<Clubs> clubs = [
  Clubs(1,
      name: 'Google Club',
      iconImage: 'assets/images/gdsc.jpg',
      description:
          "Developer Student Clubs GL Bajaj Institute Of Technology And Management is inspired by Google Developers Family. We started our journey in Feb 2019. We try to engage student developers through our hack events, codelabs and meetups. The motive is to bring designers and managers come together under one roof to create a local ecosystem of programmers & hackers in and around the Campus.",
      images: [
        'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2,f_auto,g_center,h_200,q_auto:good,w_200/v1/gcs/platform-data-dsc/chapter_photos/IMG_3156.JPG',
        'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2,f_auto,g_center,h_540,q_auto:good,w_720/v1/gcs/platform-data-dsc/chapter_photos/GLBIT_Aug6_1.jpg',
        'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2,f_auto,g_center,h_200,q_auto:good,w_200/v1/gcs/platform-data-dsc/chapter_photos/355pg_GOOGLEDEVEOLPERAPPp2.jpg',
        'https://res.cloudinary.com/startup-grind/image/upload/c_fill,dpr_2,f_auto,g_center,h_200,q_auto:good,w_200/v1/gcs/platform-data-dsc/chapter_photos/357pg_GOOGLEDEVEOLPERAPPp4.jpg',
      ]),
  Clubs(2,
      name: 'Rotract Club',
      iconImage: 'assets/images/rotract.png',
      description:
          "Rotaract club is associated with the Rotary International and so are we, we work for a cause, be it a little one or something that sends a wave of change all around. Taking up monthly projects, the members of our club work for the execution of it with great enthusiasm and pure dedication.",
      images: [
        'https://www.glbitm.org/Uploads/Image/RotaractClub-GLBajaj-2019d.jpg',
        'https://www.glbitm.org/Uploads/Image/RotaractClub-GLBajaj-2019f.jpg',
        'https://www.glbitm.org/Uploads/Image/RotaractClub-GLBajaj-2019a.jpg',
        'https://www.glbitm.org/Uploads/Image/RotaractClub-GLBajaj-2019e.jpg',
      ]),
  Clubs(3,
      name: 'Erudite Room',
      iconImage: 'assets/images/erudite.jpg',
      description:
          "The world of literature is as prodigious as it gets. Inspired by the idea of exchanging a thought through a simpler manner to expressing one's feelings; there is no bound to how literature is cognized and defined solely. The Erudite Room is one little world of literature where we pride ourselves on highest of quality, and literary craftsmanship.",
      images: [
        'https://www.memecreator.org/static/images/memes/5087233.jpg',
        'https://www.memecreator.org/static/images/memes/5087233.jpg',
        'https://www.memecreator.org/static/images/memes/5087233.jpg',
      ]),
  Clubs(4,
      name: 'Anvitha Club',
      iconImage: 'assets/images/anvitha.jpg',
      description:
          "Kehndi Hundi Si Chann Tak Raah Bana De. Taare Ne Pasand Mainu Hethan Saare Laade. Ohna Taareyan De Vich Jadon Mainu Vekhengi. Meri Yaad Jad Aaugi Tan Pata Lagguga.",
      images: [
        'https://www.memecreator.org/static/images/memes/5087233.jpg',
        'https://www.memecreator.org/static/images/memes/5087233.jpg',
        'https://www.memecreator.org/static/images/memes/5087233.jpg',
      ]),
  Clubs(5,
      name: 'Innovo Club',
      iconImage: 'assets/images/innovo.jpg',
      description:
          "Kehndi Hundi Si Chann Tak Raah Bana De. Taare Ne Pasand Mainu Hethan Saare Laade. Ohna Taareyan De Vich Jadon Mainu Vekhengi. Meri Yaad Jad Aaugi Tan Pata Lagguga.",
      images: [
        'https://www.memecreator.org/static/images/memes/5087233.jpg',
        'https://www.memecreator.org/static/images/memes/5087233.jpg',
        'https://www.memecreator.org/static/images/memes/5087233.jpg',
      ]),
  Clubs(6,
      name: 'Student Society',
      iconImage: 'assets/images/club1.png',
      description:
          "Kehndi Hundi Si Chann Tak Raah Bana De. Taare Ne Pasand Mainu Hethan Saare Laade. Ohna Taareyan De Vich Jadon Mainu Vekhengi. Meri Yaad Jad Aaugi Tan Pata Lagguga.",
      images: [
        'https://www.memecreator.org/static/images/memes/5087233.jpg',
        'https://www.memecreator.org/static/images/memes/5087233.jpg',
        'https://www.memecreator.org/static/images/memes/5087233.jpg',
      ]),
];
