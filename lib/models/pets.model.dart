class Pet {
  final String name;
  final String imageUrl;
  final String petType;
  final String age;

  Pet({
    required this.name,
    required this.imageUrl,
    required this.petType,
    required this.age,
  });
}

List<Pet> pets = [
  Pet(
    name: 'Bruce',
    imageUrl: 'assets/images/dog_1.jpg',
    petType: 'Persian Cat',
    age: '5yrs',
  ),
  Pet(
    name: 'Max',
    imageUrl: 'assets/images/dog_2.jpg',
    petType: 'Persian Cat',
    age: '5yrs',
  ),
  Pet(
    name: 'Buddy',
    imageUrl: 'assets/images/cat_2.jpg',
    petType: 'Persian Cat',
    age: '5yrs',
  ),
];
