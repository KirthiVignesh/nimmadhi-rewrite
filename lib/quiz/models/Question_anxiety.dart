class Question {
  final int id;
  final List<int> answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

const List sample_data = [
  {
    "id": 1,
    "question": "Anxious mood",
    "options": ['Mild', 'Moderate', 'Severe', 'Very Severe', 'Not Present'],
    "answer_index": [1, 2, 3, 4, 0],
  },
  {
    "id": 2,
    "question": " Tension ",
    "options": ['Mild', 'Moderate', 'Severe', 'Very Severe', 'Not Present'],
    "answer_index": [1, 2, 3, 4, 0],
  },
  {
    "id": 3,
    "question": "Fears",
    "options": ['Mild', 'Moderate', 'Severe', 'Very Severe', 'Not Present'],
    "answer_index": [1, 2, 3, 4, 0],
  },
  {
    "id": 4,
    "question": " Insomnia(sleeplessness) ",
    "options": ['Mild', 'Moderate', 'Severe', 'Very Severe', 'Not Present'],
    "answer_index": [1, 2, 3, 4, 0],
  },
  {
    "id": 5,
    "question":
        " Gastrointestinal symptoms(Difficulty in swallowing, nausea,loss of weight)",
    "options": ['Mild', 'Moderate', 'Severe', 'Very Severe', 'Not Present'],
    "answer_index": [1, 2, 3, 4, 0],
  },
  {
    "id": 6,
    "question": " Autonomic Symptoms(Dry mouth,giddiness, tendency to sweat ) ",
    "options": ['Mild', 'Moderate', 'Severe', 'Very Severe', 'Not Present'],
    "answer_index": [1, 2, 3, 4, 0],
  },
  {
    "id": 7,
    "question": "Respiratory issues",
    "options": ['Mild', 'Moderate', 'Severe', 'Very Severe', 'Not Present'],
    "answer_index": [1, 2, 3, 4, 0],
  },
  {
    "id": 8,
    "question": " Depressed mood ",
    "options": ['Mild', 'Moderate', 'Severe', 'Very Severe', 'Not Present'],
    "answer_index": [1, 2, 3, 4, 0],
  },
  {
    "id": 9,
    "question":
        " Cardiovascular symptoms (heartburn, shortness of breath, chest pain)",
    "options": ['Mild', 'Moderate', 'Severe', 'Very Severe', 'Not Present'],
    "answer_index": [1, 2, 3, 4, 0],
  },
  {
    "id": 10,
    "question":
        " Genitourinary symptoms( Frequency of micturition, urgency of micturition ) micturition-urination ",
    "options": ['Mild', 'Moderate', 'Severe', 'Very Severe', 'Not Present'],
    "answer_index": [1, 2, 3, 4, 0],
  },
  {
    "id": 11,
    "question":
        " Somatic (sensory)( blurring of vision, hot and cold flushes ) ",
    "options": ['Mild', 'Moderate', 'Severe', 'Very Severe', 'Not Present'],
    "answer_index": [1, 2, 3, 4, 0],
  },
  {
    "id": 12,
    "question":
        " Behavior at interview( strained face, sighing or rapid respiration ) ",
    "options": ['Mild', 'Moderate', 'Severe', 'Very Severe', 'Not Present'],
    "answer_index": [1, 2, 3, 4, 0],
  },
];
