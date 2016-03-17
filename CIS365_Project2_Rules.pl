/*----------------------------------------------------------------------
 * CIS 365 Project 2: GVSU Registrar's Office Option #1
 * John Tunisi and Adam Terwilliger
 * 17 March 2016
 *----------------------------------------------------------------------*/


/*----- Facts -----*/
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

/*----- Rule Combining -----*/

/*- List all courses C for professor X -*/
taughtBy(X, C) :- course(C, _, _, _, _, _, X, _), professor(X).

/*- Find what courses S are taught at time T and day D by professor P -*/
teachesAtTime(P, S, T, D) :- course(_, S, T, _, D, _, P, _).

/*- Find what professors Y teach on the same time T and day D as professor X -*/
teachAtSameTime(X, Y, T, D) :- course(_, _, T, _, D, _, X, _), course(_, _, T, _, D, _, Y, _), X \= Y.

/*- Find what students A and B are taking the same course C -*/
haveSameCourse(A, B, C) :- courseTaken(A, C, _), courseTaken(B, C, _).

/*- Find what type of course C student A is taking -*/
inCourse(A, C) :- student(A), courseTaken(A, B, _), course(B, _, _, _, _, _, _, C).

/*- Find what professor P is scheduled to be in time T and day D for different courses A and B -*/
scheduleConflict(P, T, D) :- course(A, _, T, _, D, _, P, _), course(B, _, T, _, D, _, P, _), A \= B.

/*- Find what location L is scheduled to be in time T and day D for different courses A and B -*/
locationConflict(L, T, D) :- course(A, _, T, _, D, L, _, _), course(B, _, T, _, D, L, _, _), A \= B.

/*----- Goal -----*/
print_solution :-
write('1. What does Dr. J. Leidig teach?'), nl,
findall(C, taughtBy('Dr. J. Leidig', C), Query1),
write(Query1), nl, nl,
write('2. Does Dr. J. Leidig teach Database?'), nl,
(taughtBy('Dr. J. Leidig', '353') -> Query2 = true ; Query2 = false),
write(Query2), nl, nl,
write("3. What is Dr. J. Leidig's schedule?"), nl,
findall((S, E, D), course(_, _, S, E, D, _, 'Dr. J. Leidig', _), Query3),
write(Query3), nl, nl,
write('4. Who is scheduled to teach what subject on TR, 10am?'), nl,
findall((P, X), teachesAtTime(P, X, '10:00 am', 'TR'), Query4),
write(Query4), nl, nl,
write('5. When do Dr. J. Leidig and Dr. El-Said teach at the same time?'), nl,
setof((W, Y), teachAtSameTime('Dr. J. Leidig', 'Dr. El-Said', W, Y), Query5),
write(Query5), nl, nl,
write('6. Who teaches at the same time as Dr. J. Leidig?'), nl,
findall(A, teachAtSameTime('Dr. J. Leidig', A, _, _), Query6),
%findall(A, allTeachAtSameTime('Dr. J. Leidig', A, _, _), Query6),
write(Query6), nl, nl,
write('7. What courses do Jim and Pam have in common?'), nl,
findall(B, haveSameCourse('Jim', 'Pam', B), Query7),
write(Query7), nl, nl,
write('8. Who is taking CS Courses?'), nl,
setof(F, inCourse(F, 'CS'), Query8),
write(Query8), nl, nl,
write('9. What types of courses are Gaius Baltar taking?'), nl,
setof(G, inCourse('Gaius Baltar', G), Query9),
write(Query9), nl, nl,
write('10. Are there any scheduling conflicts of professors or locations?'), nl,
write('Schedule Conflicts:'), nl,
setof((J, K, L), scheduleConflict(J, K, L), Query10),
write(Query10), nl,
write('Location Conflicts:'), nl,
setof((M, N, Q), locationConflict(M, N, Q), Query11),
write(Query11), nl.

?- print_solution.
