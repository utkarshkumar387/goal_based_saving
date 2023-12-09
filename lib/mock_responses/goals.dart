import 'package:fello_hackathon/utilities/image_path_constants.dart';

class GetGoals {
  static const getGoalsResponse = {
    'goals': [
      {
        'goal_id': 1,
        'goal_name': 'Phone',
        'goal_image': ImagePathConstants.phoneImage,
        'goal_card_color': '',
        'goal_type': ['Iphone', 'Samsung']
      },
      {
        'goal_id': 2,
        'goal_name': 'Bike',
        'goal_image': ImagePathConstants.bikeImage,
        'goal_card_color': '',
        'goal_type': ['KTM', 'Kawasaki']
      },
      {
        'goal_id': 3,
        'goal_name': 'Laptop',
        'goal_image': ImagePathConstants.laptopImage,
        'goal_card_color': ['Mackbook', 'Thinkpad'],
      },
      {
        'goal_id': 4,
        'goal_name': 'Watch',
        'goal_image': ImagePathConstants.watchImage,
        'goal_card_color': ['Apple watch', 'Titan'],
      },
      {
        'goal_id': 5,
        'goal_name': 'Headphone',
        'goal_image': ImagePathConstants.heaphoneImage,
        'goal_card_color': ['Sony', 'JBL'],
      },
    ]
  };
}
