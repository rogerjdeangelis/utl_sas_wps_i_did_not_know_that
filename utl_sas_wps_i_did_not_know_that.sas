Translating bad ascii chars and sort without by statement

Converting special ascii characters to base characters

see
https://goo.gl/vk5pC2
https://communities.sas.com/t5/Base-SAS-Programming/Invalid-ASCII-character-in-name/m-p/437132

KSharp profile
https://communities.sas.com/t5/user/viewprofilepage/user-id/18408


data have;
 want=basechar('José');
 put want=;
run;

SAS Forum: proc sort without a by statement - I did not know that

These two sorts produce the same result

      proc sort data = have out=havSrt;
        key species / ascending;
        key class / descending;
      run;quit;

      proc sort data = have out=havSrt;
      by  species descending class;
      run;


https://goo.gl/RfQqSM
https://communities.sas.com/t5/Base-SAS-Programming/problem-with-the-program/m-p/437066

makset7 profile
https://communities.sas.com/t5/user/viewprofilepage/user-id/51900


INPUT
=====

DATA HAVE;
INPUT species  class;
cards4;
1 7
1 4
1 5
1 6
1 3
2 2
1 1
2 4
2 1
2 3
2 5
2 7
1 2
2 6
3 3
3 7
;;;;
run;quit;


PROCESSES
=========

proc sort data = have out=havSrt;
  key species / ascending;
  key class / descending;
run;

proc sort data = have out=havSrt;
by  species descending class;
run;

OUTPUT
======

WANT.HAVSRT total obs=16

  SPECIES    CLASS

     1         7
     1         6
     1         5
     1         4
     1         3
     1         2
     1         1
     2         7
     2         6
     2         5
     2         4
     2         3
     2         2
     2         1
     3         7
     3         3

