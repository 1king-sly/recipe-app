// ignore_for_file: constant_identifier_names

enum CategoryName { Drinks, Snacks, BreakFast, Lunch, Dinner, Supper }

class Category {
  final CategoryName name;
  final String imagePath;

  Category({required this.name, required this.imagePath});
}

class RecipeOwner {
  final String name;
  final String? imagePath;

  RecipeOwner({required this.name, this.imagePath});
}

class Recipe {
  final CategoryName category;
  final int people;
  final String name;
  final String? description;
  final String time;
  final RecipeOwner user;
  final List<String> images;
  final List<String> ingredients;
  final List<String> instructions;

  Recipe(
      {required this.category,
      required this.people,
      required this.name,
      this.description,
      required this.time,
      required this.user,
      required this.images,
      required this.ingredients,
      required this.instructions});
}



final List<Category> categories = [
  Category(name: CategoryName.Drinks, imagePath: 'assets/images/appstore.png'),
  Category(name: CategoryName.Snacks, imagePath: 'assets/images/appstore.png'),
  Category(name: CategoryName.BreakFast, imagePath: 'assets/images/appstore.png'),
  Category(name: CategoryName.Lunch, imagePath: 'assets/images/appstore.png'),
  Category(name: CategoryName.Dinner, imagePath: 'assets/images/appstore.png'),
  Category(name: CategoryName.Supper, imagePath: 'assets/images/appstore.png'),
  Category(name: CategoryName.Drinks, imagePath: 'assets/images/appstore.png'),
  Category(name: CategoryName.Snacks, imagePath: 'assets/images/appstore.png'),
  Category(name: CategoryName.BreakFast, imagePath: 'assets/images/appstore.png'),
  Category(name: CategoryName.Lunch, imagePath: 'assets/images/appstore.png'),
  Category(name: CategoryName.Dinner, imagePath: 'assets/images/appstore.png'),
  Category(name: CategoryName.Supper, imagePath: 'assets/images/appstore.png'),
 
];


final List<Recipe> recipes = [
  Recipe(
    category: CategoryName.Drinks,
    people: 2,
    name: 'Mojito',
    description: 'A refreshing mint and lime cocktail.',
    time: '10 mins',
    user: RecipeOwner(name: 'Alice', imagePath: 'assets/images/alice.png'),
    images: ['assets/images/mojito1.png', 'assets/images/mojito2.png'],
    ingredients: ['Mint leaves', 'Lime', 'Sugar', 'Soda water', 'Ice'],
    instructions: [
      'Muddle mint leaves and lime in a glass.',
      'Add sugar and stir until dissolved.',
      'Fill the glass with ice and top with soda water.',
    ],
  ),
  Recipe(
    category: CategoryName.Snacks,
    people: 4,
    name: 'Nachos',
    description: 'Crispy nachos with melted cheese and toppings.',
    time: '15 mins',
    user: RecipeOwner(name: 'Bob', imagePath: 'assets/images/bob.png'),
    images: ['assets/images/nachos1.png', 'assets/images/nachos2.png'],
    ingredients: ['Tortilla chips', 'Cheese', 'Salsa', 'Guacamole', 'Jalapeños'],
    instructions: [
      'Spread tortilla chips on a baking tray.',
      'Sprinkle with cheese and bake until melted.',
      'Top with salsa, guacamole, and jalapeños.',
    ],
  ),
  Recipe(
    category: CategoryName.BreakFast,
    people: 1,
    name: 'Pancakes',
    description: 'Fluffy pancakes served with syrup.',
    time: '20 mins',
    user: RecipeOwner(name: 'Charlie', imagePath: 'assets/images/charlie.png'),
    images: ['assets/images/pancakes1.png', 'assets/images/pancakes2.png'],
    ingredients: ['Flour', 'Milk', 'Eggs', 'Sugar', 'Butter'],
    instructions: [
      'Mix flour, milk, eggs, and sugar into a batter.',
      'Heat a pan and melt butter.',
      'Pour batter into the pan and cook on both sides until golden.',
    ],
  ),
   Recipe(
    category: CategoryName.Lunch,
    people: 3,
    name: 'Grilled Chicken Salad',
    description: 'A healthy and hearty grilled chicken salad.',
    time: '25 mins',
    user: RecipeOwner(name: 'Diana', imagePath: 'assets/images/diana.png'),
    images: ['assets/images/salad1.png', 'assets/images/salad2.png'],
    ingredients: ['Chicken breast', 'Lettuce', 'Cherry tomatoes', 'Cucumber', 'Olive oil'],
    instructions: [
      'Season and grill the chicken breast until cooked.',
      'Chop lettuce, cherry tomatoes, and cucumber.',
      'Mix vegetables and sliced chicken in a bowl.',
      'Drizzle with olive oil and serve.',
    ],
  ),
  Recipe(
    category: CategoryName.Dinner,
    people: 5,
    name: 'Spaghetti Bolognese',
    description: 'Classic Italian pasta with a rich meat sauce.',
    time: '40 mins',
    user: RecipeOwner(name: 'Ethan', imagePath: 'assets/images/ethan.png'),
    images: ['assets/images/spaghetti1.png', 'assets/images/spaghetti2.png'],
    ingredients: ['Spaghetti', 'Ground beef', 'Tomato sauce', 'Garlic', 'Onion', 'Olive oil'],
    instructions: [
      'Boil spaghetti until al dente.',
      'Cook ground beef with garlic and onion in olive oil.',
      'Add tomato sauce and simmer for 20 minutes.',
      'Serve meat sauce over spaghetti.',
    ],
  ),
  Recipe(
    category: CategoryName.Supper,
    people: 2,
    name: 'Tomato Soup',
    description: 'A comforting bowl of creamy tomato soup.',
    time: '30 mins',
    user: RecipeOwner(name: 'Fiona', imagePath: 'assets/images/fiona.png'),
    images: ['assets/images/tomatosoup1.png', 'assets/images/tomatosoup2.png'],
    ingredients: ['Tomatoes', 'Garlic', 'Onion', 'Cream', 'Bread for croutons'],
    instructions: [
      'Roast tomatoes, garlic, and onion until tender.',
      'Blend roasted ingredients with cream.',
      'Heat the soup and serve with croutons.',
    ],
  ),
  Recipe(
    category: CategoryName.Drinks,
    people: 1,
    name: 'Smoothie Bowl',
    description: 'A vibrant smoothie bowl with fresh fruits.',
    time: '10 mins',
    user: RecipeOwner(name: 'Grace', imagePath: 'assets/images/grace.png'),
    images: ['assets/images/smoothiebowl1.png', 'assets/images/smoothiebowl2.png'],
    ingredients: ['Banana', 'Berries', 'Yogurt', 'Granola', 'Honey'],
    instructions: [
      'Blend banana, berries, and yogurt into a smoothie.',
      'Pour into a bowl and top with granola and fresh fruits.',
      'Drizzle with honey and enjoy.',
    ],
  ),
  Recipe(
    category: CategoryName.Snacks,
    people: 6,
    name: 'Spring Rolls',
    description: 'Crispy and delicious vegetable spring rolls.',
    time: '30 mins',
    user: RecipeOwner(name: 'Henry', imagePath: 'assets/images/henry.png'),
    images: ['assets/images/springrolls1.png', 'assets/images/springrolls2.png'],
    ingredients: ['Spring roll wrappers', 'Cabbage', 'Carrot', 'Soy sauce', 'Oil for frying'],
    instructions: [
      'Shred cabbage and carrot, then stir-fry with soy sauce.',
      'Place filling in wrappers and roll tightly.',
      'Fry in hot oil until golden and crispy.',
    ],
  ),
  Recipe(
    category: CategoryName.BreakFast,
    people: 2,
    name: 'Avocado Toast',
    description: 'A simple and nutritious avocado toast.',
    time: '5 mins',
    user: RecipeOwner(name: 'Ivy', imagePath: 'assets/images/ivy.png'),
    images: ['assets/images/avocadotoast1.png', 'assets/images/avocadotoast2.png'],
    ingredients: ['Bread', 'Avocado', 'Salt', 'Pepper', 'Lemon juice'],
    instructions: [
      'Toast the bread slices.',
      'Mash avocado and season with salt, pepper, and lemon juice.',
      'Spread avocado on toast and serve.',
    ],
  ),
  Recipe(
    category: CategoryName.Lunch,
    people: 4,
    name: 'Fish Tacos',
    description: 'Delicious fish tacos with fresh toppings.',
    time: '20 mins',
    user: RecipeOwner(name: 'Jack', imagePath: 'assets/images/jack.png'),
    images: ['assets/images/fishtacos1.png', 'assets/images/fishtacos2.png'],
    ingredients: ['Tortillas', 'Fish fillet', 'Cabbage', 'Salsa', 'Lime'],
    instructions: [
      'Season and grill the fish fillet.',
      'Warm the tortillas and prepare cabbage slaw.',
      'Assemble tacos with fish, cabbage, salsa, and a squeeze of lime.',
    ],
  ),
];