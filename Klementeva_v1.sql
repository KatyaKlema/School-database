CREATE SCHEMA school;

CREATE TABLE school.teachers (
  teachers_id INT NOT NULL, UNIQUE, PRIMARY KEY,
  birth VARCHAR(100) NOT NULL,
  name VARCHAR(100) NOT NULL,
  phone_number INT NOT NULL, CHECK (phone_number > 0),
  category VARCHAR(20) NOT NULL, CHECK(category > 0),
  lesson VARCHAR(20) NOT NULL
);

CREATE TABLE school.students (
  students_id INT NOT NULL, UNIQUE, PRIMARY KEY,
  birth VARCHAR(100) NOT NULL,
  name VARCHAR(100) NOT NULL,
  class INT NOT NULL, CHECK (class > 0),
  phone_number INT NOT NULL,CHEACK(phone_number > 0),
);

CREATE TABLE school.lessons (
  lessons_id INT NOT NULL, UNIQUE, PRIMARY KEY,
  class  INT NOT NULL, CHECK(class > 0),
  lesson VARCHAR(100) NOT NULL,
);

CREATE TABLE school.audiences (
  audiences_id INT NOT NULL UNIQUE, PRIMARY KEY,
  type VARCHAR(100) NOT NULL,
  predestination VARCHAR(100) NOT NULL,
);

CREATE TABLE school.additional (
  additional_id INT NOT NULL, UNIQUE, PRIMARY KEY,
  lesson VARCHAR(100) NOT NULL,
  class  INT NOT NULL, CHECK(class > 0),
  duration INT NOT NULL, CHECK(duration > 0),
);

CREATE TABLE school.additional_students (
  students_id INT REFERENCES school.students(students_id),
  teachers_id INT REFERENCES school.teachers(teachers_id),
  frequency INT NOT NULL, CHECK(frequency > 0),
);

CREATE TABLE school.teachers_students(
  teachers_id INT REFERENCES school.teachers(teachers_id),
  students_id INT REFERENCES school.students(students_id),
);

CREATE TABLE school.audiences_additionals(
  audiences_id INT REFERENCES school.audiences(audiences_id),
  additional_id INT REFERENCES school.additional(additional_id),
  frequency_additional INT NOT NULL, CHECK(frequency_additional > 0),
);

CREATE TABLE school.audiences_lessons ( 
lessons_id INT REFERENCES school.lessons(lessons_id),
audiences_id INT REFERENCES shool.audiences(audiences_id),
);

CREATE TABLE school.lessons_students(
teachers_id INT REFERENCES school.teachers(teachers_id),
lessons_id INT REFERENCES school.lessons(lessons_id),
);


-----------------------------------------
INSERT INTO school.teachers (teachers_id, birth, name, phone_number, category, lesson) VALUES
  (1, '25.02.1978','Иванова Лариса Ивановна', '8-919-670-36-53', 1, 'математика'),
  (2, '02.02.1966', 'Никаноров Василий Иванович', '8-916-348-33-80', 'физика'),
  (3, '23.01.1980', 'Васильев Николай Георгиевич', '8-916-456-78-23', 'биология'),
  (4, '12.12.1969', 'Горбунова Мария Алексеевна','8-919-345-34-54', 'литература' ),
  (5, '13.05.1978', 'Петухова Надежда Викторовна','8-919-654-26-31', 'география'),
  (6, '27.11.1982', 'Литвинова Любовь Васильевна','8-923-563-32-12', 'русский язык'),
  (7, '16.04.1983', 'Николаев Виктор Геннадьевич', '8-917-456-23-23', 'история'),
  (8, '13.07.1980', 'Пяскорская Наталия Вадимовна', '8-947-789-32-32',  'литература'),
  (9, '16.11.1978', 'Носова Надежда Игоревна','8_967-345-24-44', 'русский язык'),
  (10, '19.09.1978', 'Иванов Петр Васильевич', '8-934-234-33-56', 'информатика');

INSERT INTO school.students (students_id, birth, name, class, phone_number) VALUES
  (1, '12.12.2000','Михров Василий Георгиевич', 11, '8-916-245-72-22'),
  (2, '08.09.2000', ' Свотина Наталия Петровна', 11, '9-919-539-25-19'),
  (3, '23.08.2002',  'Арифова Анастасия Николаевна', 9, '8-956-673-71-89'),
  (4, '18.05.2001', 'Чикунова Мария Викторовна', 10, '8-922-546-72-77'),
  (5, '18.05.2001', 'Чикунов Илья Викторович', 10, '8-928-123-65-11'),
  (6, '06.06.2001', 'Петров Григорий Иванович', 10, '8-917-678-25-43'),
  (7, '07.12.2000', 'Дурова Любовь Михайловна', 11, '8-946-249-63-91' ),
  (8, '11.10.2000', 'Петрова Мария Ивановна', 11, '8-915-361-67-91'),
  (9, '17.08.2000', 'Николаева Анжелика Леонидовна', 11, '8-910-401-62-42'),
  (10, '19.10.2001', 'Терентьев Юрий Михайлович', 10, '8-917-462-56-31'),
  (11, '15.12.2000', 'Григорьева Елена Александровна', 11, '8-963-164-63-39'),
  (12, '20.08.2000', 'Васильев Иван Петрович', 11, '8-935-362-63-22');

INSERT INTO school.lessons (lessons_id, class,  lesson) VALUES
  (1, 11, 'математика'),
  (2, 10, 'русский язык'),
  (3, 11, 'литература'),
  (4, 11, 'история'),
  (5, 11, 'биология');

INSERT INTO school.audiences (audiences_id, type, predestinatio) VALUES
  (1, 'класс', 'занятия'),
  (2, 'класс', 'занятия'),
  (3, 'актовый зал', 'мероприятия'),
  (4, 'столовая', 'прием пищи'),
  (5, 'класс', ' занятия'),
  (6, 'класс','занятия'),
  (7, 'спортивный зал', 'занятие спортом'),
  (8, 'кладовая', 'хранение шкоьного инвентаря'),
  (9, 'класс','занятия'),
  (10,'учительска', 'проведение собраний');

INSERT INTO school.additional (additional_id, class, lesson, duration) VALUES
  (1, 11, 'математика', 90),
  (2, 10, 'литература', 90),
  (3, 11,'информатика', 60);
  

INSERT INTO school.additional_students (students_id, teachers_id, frequency) VALUES
  (1, 1, 1),
  (2, 2, 2),
  (3, 3, 1);
  
INSERT INTO school.teachers_students(teachers_id, students_id) VALUES
  (1, 2),
  (1, 1),
  (1, 3),
  (1, 4),
  (1, 5),
  (2, 1),
  (2, 2),
  (2, 5);

  INSERT INTO school.audiences_additionals(audiences_id, additional_id, frequency_additional) VALUES
  (1, 1, 90),
  (1, 2, 90),
  (2, 1, 90),
  (3, 2, 60);

  INSERT INTO school.audiences_lessons(lessons_id, audiences_id) VALUES
  (1, 2),
  (1, 1),
  (1, 3),
  (2, 1),
  (2, 2),
  (2, 3);

  INSERT INTO school.lessons_students(teachers_id, lessons_id) VALUES
    (1, 2),
    (1, 1),
    (2, 1),
    (2, 2),
    (2, 3),
    (3, 1),
    (3, 8);
SELECT * FROM school.teachers;
SELECT * FROM school.students;
SELECT * FROM school.lessons;
SELECT * FROM school.audiences;
SELECT * FROM school.additional_students;
SELECT * FROM school.teachers_students;
SELECT * FROM school.audiences_additionals;
SELECT * FROM school.audiences_lessons;
SELECT * FROM school.lessons_students;
