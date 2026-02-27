def make_student(students):
    name = input('Enter student name: ')
    grade = input('Enter student grade: ')
    students[name] = grade
    print("Student made: {}, Grade: {}".format(name, grade))
    print(students)
    return students

def edit_grade(students):
    name = input('Enter student name: ')
    grade = input('Enter new grade: ')
    students[name] = grade
    print('New grade is {}'.format(grade))
    print(students)
    return students


def delete_grade(students):
    name = input('Enter student name: ')
    del(students[name])
    print('Grade has been deleted.')
    print(students)
    return students


with open('grades.txt', 'r') as file:
    students = {}
    for line in file:
        entry = line.replace('\"', '').replace(',', '').split(':')
        students[entry[0].strip("' ")] = entry[1].strip()

    make_student(students)
    edit_grade(students)
    delete_grade(students)
