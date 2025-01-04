class PetCare {
  final String name;
  final String location;
  final String imageUrl;
  final double distance;
  final double rating;
  final List<String> tags;

  PetCare(
      {required this.name,
      required this.location,
      required this.imageUrl,
      required this.distance,
      required this.rating,
      required this.tags});
}

final List<PetCare> petCareList = [
  PetCare(
    name: 'Dog Pet Care',
    location: 'Askari X',
    distance: 2.2,
    rating: 3.2,
    imageUrl: 'assets/images/dog_1.jpg',
    tags: ['Bathing', 'Teeth'],
  ),
  PetCare(
    name: 'Animal Pet Care',
    location: 'Okara',
    distance: 5.0,
    rating: 4.4,
    imageUrl: 'assets/images/dog_2.jpg',
    tags: ['Nail', 'Teeth'],
  ),
  PetCare(
    name: 'Cat Pet Care',
    location: 'Nfc Phase 1',
    distance: 1.2,
    rating: 5,
    imageUrl: 'assets/images/dog_1.jpg',
    tags: ['Bathing', 'Teeth', 'Nail'],
  ),
];
