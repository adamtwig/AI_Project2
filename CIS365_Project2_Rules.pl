course('467', 'CS Project', '10:00 am', ' 10:50 am', 'MWF', 'MAK B1118', 'Dr. Engelsma', 'CS').
course('463', 'IS Project', '2:00 pm', ' 2:50 pm', 'MWF', 'MAK D2123', 'Mr. Lange', 'IS').
course('460', 'MIS', '10:00 am', ' 11:15 am', 'TR', 'MAK B1116', 'Dr. P. Leidig', 'IS').
course('457', 'Data Communications', '2:00 pm', ' 2:50 pm', 'MWF', 'MAK D1117', 'Dr. Kalafut', 'CS').
course('452', 'OS Concepts', '1:00 pm', ' 1:50 pm', 'MWF', 'MAK D1117', 'Dr. Wolffe', 'CS').
course('451', 'Computer Architecture', '10:00 am', ' 10:50 am', 'MWF', 'MAK B1118', 'Dr. Kurmas', 'CS').
course('450', 'IS Project Management', '12:00 pm', ' 12:50 pm', 'MWF', 'MAK D1117', 'Dr. Schymik', 'IS').
course('443', 'Software Development Tools', '11:00 am', ' 11:50 am', 'MWF', 'MAK B1124', 'Ms. Peterman', 'IS').
course('437', 'Distributed Computing', '10:00 am', ' 10:50 am', 'MWF', 'MAK B1118', 'Dr. Engelsma', 'CS').
course('375', 'Wireless Networking Systems', '6:00 pm', ' 7:50 pm', 'R', 'EC 612', 'Dr. El-Said', 'IS').
course('371', 'Web Application Programming', '4:00 pm', ' 5:15 pm', 'MW', 'MAK D1117', 'Dr. Scripps', 'CS').
course('365', 'AI', '10:00 am', ' 11:15 am', 'TR', 'MAK D1117', 'Dr. J. Leidig', 'CS').
course('361', 'System Programming', '4:00 pm', ' 5:15 pm', 'TR', 'MAK B1116', 'Dr. Trefftz', 'CS').
course('358', 'Information Insurance', '3:00 pm', ' 3:50 pm', 'MWF', 'MAK A1105', 'Dr. Kalafut', 'CS').
course('353', 'Database', '12:00 pm', ' 12:50 pm', 'MWF', 'MAK B1118', 'Dr. Alsabbagh', 'CS').
course('350', 'Software Engineering', '10:00 am', ' 10:50 am', 'MWF', 'MAK D1117', 'Dr. Jorgensen', 'CS').
course('343', 'Structure of Programming Languages', '1:00 pm', ' 1:50 pm', 'MWF', 'MAK B1124', 'Dr. Nandigam', 'CS').
course('339', 'IT Project Management', '1:00 pm', ' 2:15 pm', 'TR', 'MAK A1105', 'Mr. Lange', 'IS').
course('337', 'Network Systems Management', '3:00 pm', ' 3:50 pm', 'TR', 'MAK B1124', 'Dr. El-Said', 'IS').
course('333', 'DB Management and Implementation', '6:00 pm', ' 8:50 pm', 'W', 'MAK D1117', 'Ms. Posada', 'IS').
course('330', 'Systems Analysis and Design', '9:00 am', ' 9:50 am', 'MWF', 'MAK D1117', 'Dr. Du', 'IS').
course('661', 'Medical and BioInformatics', '6:00 pm', ' 8:50 pm', 'T', 'EC 612', 'Dr. J. Leidig', 'CIS').
course('671', 'Information Visualization', '6:00 pm', ' 8:50 pm', 'R', 'EC 612', 'Dr. J. Leidig', 'CIS').
course('691', 'MBI Capstone', '6:00 pm', ' 8:50 pm', 'M', 'EC 612', 'Dr. J. Leidig', 'CIS').
course('Error', 'Error', '6:00 pm', ' 8:50 pm', 'M', 'EC 612', 'Dr. J. Leidig', 'CIS').



professor('Dr. Engelsma').
professor('Mr. Lange').
professor('Dr. P. Leidig').
professor('Dr. Kalafut').
professor('Dr. Wolffe').
professor('Dr. Kurmas').
professor('Dr. Schymik').
professor('Ms. Peterman').
professor('Dr. El-Said').
professor('Dr. Scripps').
professor('Dr. J. Leidig').
professor('Dr. Trefftz').
professor('Dr. Alsabbagh').
professor('Dr. Jorgensen').
professor('Dr. Nandigam').
professor('Ms. Posada').
professor('Dr. Du').

student('Jim').
student('Pam').
student('Kara Thrace').
student('Gaius Baltar').

courseTaken('Jim' ,'467' ,'CS Project').
courseTaken('Jim' ,'452' ,'OS Concepts').
courseTaken('Jim' ,'457' ,'Data Communications').
courseTaken('Pam' ,'437' ,'Distributed Computing').
courseTaken('Pam' ,'457' ,'Data Communications').
courseTaken('Pam' ,'452' ,'OS Concepts').
courseTaken('Kara Thrace' ,'467' ,'CS Project').
courseTaken('Kara Thrace' ,'452' ,'OS Concepts').
courseTaken('Kara Thrace' ,'365' ,'AI').
courseTaken('Gaius Baltar' ,'463' ,'IS Project').
courseTaken('Gaius Baltar' ,'460' ,'MIS').

taughtBy(X, C) :- course(C, _, _, _, _, _, X, _), professor(X).
teachesAtTime(P, S, T, D) :- course(_, S, T, _, D, _, P, _).
teachAtSameTime(X, Y, T, D) :- course(_, _, T, _, D, _, X, _), course(_, _, T, _, D, _, Y, _).
haveSameCourse(A, B, C) :- courseTaken(A, C, _), courseTaken(B, C, _).
inCourse(A, C) :- student(A), courseTaken(A, B, _), course(B, _, _, _, _, _, _, C).
scheduleConflict(P, X) :- course(A, _, X, _, D, _, P, _), course(B, _, X, _, D, _, P, _), A \= B.

print_solution :-
write('What does Dr. J. Leidig teach?'), nl,
findall(C, taughtBy('Dr. J. Leidig', C), Query1),
write(Query1), nl, nl,
write('Does Dr. J. Leidig teach Database?'), nl,
(taughtBy('Dr. J. Leidig', '353') -> Z = true ; Z = false),
write(Z), nl, nl,
write('What is Dr. J. Leidigs schedule'), nl,
findall((S, E, D), course(_, _, S, E, D, _, 'Dr. J. Leidig', _), Query2),
write(Query2), nl, nl,
write('Who is scheduled to teach what subject on TTH, 10am?'), nl,
findall((P, X), teachesAtTime(P, X, '10:00 am', 'TR'), Query3),
write(Query3), nl, nl,
write('When do Dr. J. Leidig and Dr. El-Said teach at the same time?'), nl,
setof((W, Y), teachAtSameTime('Dr. J. Leidig', 'Dr. El-Said', W, Y), Query4),
write(Query4), nl, nl,
write('Who teaches at the same time as Dr. J. Leidig?'), nl,
findall(A, teachAtSameTime('Dr. J. Leidig', A, _, _), Query5),
write(Query5), nl, nl,
write('What courses do Jim and Pam have in common?'), nl,
findall(B, haveSameCourse('Jim', 'Pam', B), Query6),
write(Query6), nl, nl,
write('Who is taking CS Courses?'), nl,
setof(F, inCourse(F, 'CS'), Query7),
write(Query7), nl, nl,
write('What types of courses are Gaius Baltar taking?'), nl,
setof(G, inCourse('Gaius Baltar', G), Query8),
write(Query8), nl, nl,
write('Are there any scheduling conflicts of professors or locations?'), nl,
findall(J, scheduleConflict('Dr. J. Leidig', J), Query9),
write(Query9), nl, nl.
