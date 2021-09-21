class Schedule:
    def __init__(self):
        self.num_courses = 0
        self.course_department = ''
        self.course_num = 0
        self.course_name = ''
        self.credits = 0
        self.lecture_days = ''
        self.start_time = ''
        self.end_time = ''
        self.avg_grade = 0

    def print_details(self):
            print('COURSE {}: '.format(self.num_courses) +
          '{}: {}\n'.format(self.course_department, self.course_num) +
          'Number of Credits: {}\n'.format(self.credits) +
          'Days of Lectures: {}\n'.format(self.lecture_days) +
          'Lecture Time: {} - {}\n'.format(self.start_time, self.end_time) +
          'Stat: on average, students get {} in this course\n'.format(
              self.avg_grade)
          )


with open('classesInput.txt', 'r') as file:
    for line in file:
        word = line.split()
        schedule = Schedule()
        for word in range(9):
            if word == 0:
                schedule.num_courses = word
            elif word == 1 or word % 9 == 1:
                schedule.course_department = word
            elif word == 2:
                schedule.course_num = word
            elif word == 3:
                schedule.course_name = word
            elif word == 4:
                schedule.credits = word
            elif word == 5:
                schedule.lecture_days = word
            elif word == 6:
                schedule.start_time = word
            elif word == 7:
                schedule.end_time = word
            elif word == 8:
                schedule.avg_grade = word

    schedule.print_details()
