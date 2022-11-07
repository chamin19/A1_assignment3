# cps721_A3

This assignment solves three different types of Constraint Satisfaction Problems (CSPs).

## Crytopgraphic puzzle
```
      STRAW
   *     TO
     ------
      WARTS
   + STRAW   
    -------
     CHAIRS
```

```crypt1.pl``` uses generate and test to solve the cryptographic puzzle  
```crypt2.pl``` uses smart interleaving of generate and test to solve the same puzzle  

The difference in run time is noted in crypt.txt, with the solution in crypt2.pl being noticeably faster.  

## Timetable problem
A student takes the following courses: art, math, computer science, and dance.   

- Art is offered Mon, Wed, Fri at 10am, or Mon, Wed, Fri at 11am  
- Dance is offered Fri from 1-4pm  
- Math is offered Mon at 11am, Wed at 3am, Fri at 3am, or Mon at 2pm, Wed at 2pm, Fri at 11am  
- Computer Science is offered on Mon 11am, Wed 11am, Fri 12pm, or Mon 12pm, Wed 12pm, Wed 3pm  

The student should have an hour of lunch each day at 12pm or 1pm. 

```timetable.pl``` uses smart interleaving of generate and test to solve the problem  
```timetable.txt``` demonstrates the runtime and solution for the student's timetable  

## 3 Kenken puzzle

![kk](https://user-images.githubusercontent.com/68608167/200210282-357367e7-40fb-4baf-bfdd-5af906c38aba.png)

```kenken.pl``` uses smart interleaving of generate and test to solve the puzzle  
```kenken.txt``` demonstrates the runtime and solution for the puzzle
